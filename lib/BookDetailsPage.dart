import 'package:bookapp/Commande.dart';
import 'package:bookapp/DatabaseHelper.dart';
import 'package:bookapp/HomePage.dart';
import 'package:bookapp/Panier.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './models/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sqflite/sqflite.dart';



class BookDetailsPage extends StatefulWidget {
  final Book book;

  const BookDetailsPage({
    Key? key,
     required this.book}) : super(key: key);

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
   int _selectedIndex = 0;
  double _rating = 3.5;
  int _quantite =1;
 DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
   body: Container(
    margin: EdgeInsets.symmetric(vertical: 00,horizontal: 10),
    child: ListView(
    
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 14.0),

            Center(
              child: Image.network(
                widget.book.coverUrl,
                width: 200.0,
                height: 250.0,
              ),
            ),
            SizedBox(height: 14.0),
            Text(
              'Titre: ${widget.book.title}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Auteur: ${widget.book.author}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              widget.book.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 14.0),
            Text(
              'Note moyenne:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 24.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 14.0),
            Text(
              'Prix: ${widget.book.prix} dt',
              style: Theme.of(context).textTheme.bodyText1,
            ),
             const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quantity: $_quantite',
                  style: Theme.of(context).textTheme.bodyText1,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_quantite > 1) {
                              _quantite--;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 255, 17, 0),
                          ),
                          child: Icon(Icons.remove, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _quantite++;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 4, 185, 73),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
             SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                width: 200.0,
                height: 40.0,
             child : ElevatedButton(
               onPressed: () async {
                  Book newBook = Book(
                    id: widget.book.id, // Use widget.book here
                    title: widget.book.title,
                    author: widget.book.author,
                    coverUrl: widget.book.coverUrl,
                    averageRating: widget.book.averageRating,
                    description: widget.book.description,
                    prix: widget.book.prix,
                    quantite: _quantite,
                    
                   );
                  int res = await databaseHelper.saveBook(newBook);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Livre ajouté au panier'),
                      duration: Duration(seconds: 1),
                      backgroundColor: Color.fromARGB(255, 4, 218, 86),
                    ),
                  );
                },
                child: const Text('Ajouter à la carte'),
              ),
                
            ),
              ),
            
            
          ],
         
        ),
  
      ),
    
     bottomNavigationBar: CurvedNavigationBar(
  backgroundColor: Colors.white,
  color: Color.fromARGB(255, 21, 199, 86),
  buttonBackgroundColor: Color.fromARGB(255, 21, 199, 86),
  height: 50,
  index: _selectedIndex,
  onTap: (index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } 
 if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PanierPage(),
        ),
      );   
      
       }
       else if (index == 2) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CommandePage(),
        ),
      );
    }
    _selectedIndex = index;
  },
  items: <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.remove_shopping_cart_outlined, size: 30)
  ],
)

    );
  }
}
