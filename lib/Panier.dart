import 'package:flutter/material.dart';

import './models/Book.dart';
import 'DatabaseHelper.dart';

class PanierPage extends StatefulWidget {
  @override
  _PanierPageState createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  final databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: databaseHelper.getBooks(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
                if (snapshot.hasData) {
                  List<Book> booksList = snapshot.data!;
                  return ListView.builder(
                    itemCount: booksList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(booksList[index].title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(booksList[index].author),
                            Text("Quantity: ${booksList[index].quantite}"),
                          ],
                        ),
                        trailing: Text(
                            "\$${booksList[index].prix * booksList[index].quantite}"),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                booksList[index].dininuerQuantite();
                                int res = await databaseHelper.updateBook(booksList[index]);
                                setState(() {});
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(booksList[index].quantite.toString()),
                            IconButton(
                              onPressed: () async {
                                booksList[index].ajouterQuantite();
                                int res = await databaseHelper
                                    .updateBook(booksList[index]);
                                setState(() {});
                              },
                              icon: Icon(Icons.add),
                            ),
                            IconButton(
                              onPressed: () async {
                                int res = await databaseHelper
                                    .deleteBook(booksList[index].id);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Prix Totale : ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder(
                  future: databaseHelper.getBooks(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Book>> snapshot) {
                    if (snapshot.hasData) {
                      List<Book> booksList = snapshot.data!;
                      double totalPrice = 0;
                      for (var i = 0; i < booksList.length; i++) {
                        totalPrice +=
                            (booksList[i].prix * booksList[i].quantite);
                      }
                      return Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Text(
                        "\DT 0.00",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      );
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    List<Book> booksList = await databaseHelper.getBooks();
                    double totalPrice = 0;
                    for (var i = 0; i < booksList.length; i++) {
                      totalPrice += (booksList[i].prix * booksList[i].quantite);
                    }
                    String descc = '';
                    for (var i = 0; i < booksList.length; i++) {
                      descc +=
                          '${booksList[i].title}x${booksList[i].quantite}\n';
                    }
                    int res = -1;
                    if (descc != '') {
                      res = await databaseHelper.saveCmd(descc, totalPrice);
                    }
                    if (res > 0) {
                      await databaseHelper.deleteAll();
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Commande Ajouté avec succées"),
                      ));
                    }
                    setState(() {});
                  },
                  child: Text("Commander"),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 4, 218, 86),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
