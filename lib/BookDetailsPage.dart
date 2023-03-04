import 'package:bookapp/ReservationPage.dart';
import 'package:bookapp/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class BookDetailsPage extends StatefulWidget {
  final Book book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  double _rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.book.coverUrl,
                width: 200.0,
                height: 300.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Titre: ${widget.book.title}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Auteur: ${widget.book.author}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.book.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            Text(
              'Prix: ${widget.book.prix} dt',
              style: Theme.of(context).textTheme.bodyText1,
            ),
             SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                width: 200.0,
                height: 40.0,
             child : ElevatedButton(
              onPressed: () {
               Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReservationPage(
          bookTitle: widget.book.title,
          bookPrice: widget.book.prix,
          bookCoverUrl: widget.book.coverUrl),
          ),
    );
              },
              child: Text(
                'Réserver'
               ),
              ),
                
            ),
              ),
            
            
          ],
         
        ),
      ),
    );
  }
}
