import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  final String bookTitle;
  final double bookPrice;
  final String bookCoverUrl;

  const ReservationPage({Key? key, required this.bookTitle, required this.bookPrice, required this.bookCoverUrl})
      : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réservation'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Titre du livre: ${widget.bookTitle}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Prix: ${widget.bookPrice} dt',
              style: TextStyle(fontSize: 18.0),
            ),
             SizedBox(height: 16.0),
            // Afficher l'image du livre en utilisant un Hero widget
            Hero(
              tag: 'book_cover_${widget.bookTitle}',
              child: Image.network(
                widget.bookCoverUrl,
                height: 200.0,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Numéro de carte',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _expiryDateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Date d\'expiration (MM/AA)',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: _cvvController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                width: 200.0,
                height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  // Ajouter la fonctionnalité de paiement ici
                },
                child: Text('Payer'),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
