import 'package:bookapp/BookDetailsPage.dart';
import 'package:bookapp/models/book.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  final List<Book> books = [
    Book(
      id: 1,
      title: 'Le Seigneur des anneaux',
      author: 'J.R.R. Tolkien',
      description:
          'Dans ce chef-d\'œuvre de la fantasy, le hobbit Frodon Sacquet doit détruire l\'Anneau unique pour sauver la Terre du Milieu de Sauron.',
      coverUrl: 'https://fr.web.img6.acsta.net/medias/nmedia/00/02/54/95/affiche2.jpg',
      prix: 12,
      averageRating: 4.5,
    ),
    Book(
      id: 2,
      title: 'Harry Potter et la pierre philosophale',
      author: 'J.K. Rowling',
      description:
          'Dans ce premier tome de la célèbre série de livres pour enfants, Harry Potter découvre qu\'il est un sorcier et commence son voyage à Poudlard.',
      coverUrl: 'https://i5.walmartimages.com/asr/911d93d0-e3ef-4e4d-88d7-033565f517a5.02928fdbe6a3a116fab4368942e507cf.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff',
      prix: 20,
      averageRating: 4.8,
    ),
    Book(
      id: 3,
      title: '1984',
      author: 'George Orwell',
      description:
          'Dans ce roman dystopique classique, le personnage principal Winston Smith se rebelle contre le régime totalitaire qui contrôle tous les aspects de la vie.',
      coverUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTveU9X9FR5ocoSxsOv1jfksuS7n91O7AwI_g&usqp=CAUg',
      prix: 30,
      averageRating: 4.3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookshelf'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: 
      ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              books[index].coverUrl,
              width: 50.0,
              height: 80.0,
            ),
            title: Text(books[index].title),
            subtitle: Text('Auteur: ${books[index].author}'),
            trailing: Text('${books[index].averageRating}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsPage(book: books[index]),
                ),
              );
            },
          );
        },
      ),
       bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
