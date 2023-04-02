import 'package:bookapp/BookDetailsPage.dart';
import 'package:bookapp/Commande.dart';
import 'package:bookapp/Panier.dart';
import './models/Book.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late List<String> bookTitles ;

   @override
  void initState() {
    super.initState();
    bookTitles = books.map((book) => book.title).toList();
  }

  int _selectedIndex = 0;

  final List<Book> books = [
    Book(
        id: 1,
        title: 'Le Seigneur des anneaux',
        author: 'J.R.R. Tolkien',
        description:
            'Dans ce chef-d\'œuvre de la fantasy, le hobbit Frodon Sacquet doit détruire l\'Anneau unique pour sauver la Terre du Milieu de Sauron.',
        coverUrl:
            'https://fr.web.img6.acsta.net/medias/nmedia/00/02/54/95/affiche2.jpg',
        prix: 12,
        averageRating: 4.5,
        quantite: 1),
    Book(
        id: 2,
        title: 'Harry Potter et la pierre philosophale',
        author: 'J.K. Rowling',
        description:
            'Dans ce premier tome de la célèbre série de livres pour enfants, Harry Potter découvre qu\'il est un sorcier et commence son voyage à Poudlard.',
        coverUrl:
            'https://i5.walmartimages.com/asr/911d93d0-e3ef-4e4d-88d7-033565f517a5.02928fdbe6a3a116fab4368942e507cf.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff',
        prix: 20,
        averageRating: 4.8,
        quantite: 1),
    Book(
        id: 3,
        title: '1984',
        author: 'George Orwell',
        description:
            'Dans ce roman dystopique classique, le personnage principal Winston Smith se rebelle contre le régime totalitaire qui contrôle tous les aspects de la vie.',
        coverUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTveU9X9FR5ocoSxsOv1jfksuS7n91O7AwI_g&usqp=CAUg',
        prix: 30,
        averageRating: 4.3,
        quantite: 1),
         Book(
        id: 4,
        title: 'Le Seigneur des anneaux',
        author: 'J.R.R. Tolkien',
        description:
            'Dans ce chef-d\'œuvre de la fantasy, le hobbit Frodon Sacquet doit détruire l\'Anneau unique pour sauver la Terre du Milieu de Sauron.',
        coverUrl:
            'https://fr.web.img6.acsta.net/medias/nmedia/00/02/54/95/affiche2.jpg',
        prix: 12,
        averageRating: 4.5,
        quantite: 1),
    Book(
        id: 5,
        title: 'Harry Potter et la pierre philosophale',
        author: 'J.K. Rowling',
        description:
            'Dans ce premier tome de la célèbre série de livres pour enfants, Harry Potter découvre qu\'il est un sorcier et commence son voyage à Poudlard.',
        coverUrl:
            'https://i5.walmartimages.com/asr/911d93d0-e3ef-4e4d-88d7-033565f517a5.02928fdbe6a3a116fab4368942e507cf.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff',
        prix: 20,
        averageRating: 4.8,
        quantite: 1),
    Book(
        id: 6,
        title: '1984',
        author: 'George Orwell',
        description:
            'Dans ce roman dystopique classique, le personnage principal Winston Smith se rebelle contre le régime totalitaire qui contrôle tous les aspects de la vie.',
        coverUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTveU9X9FR5ocoSxsOv1jfksuS7n91O7AwI_g&usqp=CAUg',
        prix: 30,
        averageRating: 4.3,
        quantite: 1),
         Book(
        id: 7,
        title: 'Le Seigneur des anneaux',
        author: 'J.R.R. Tolkien',
        description:
            'Dans ce chef-d\'œuvre de la fantasy, le hobbit Frodon Sacquet doit détruire l\'Anneau unique pour sauver la Terre du Milieu de Sauron.',
        coverUrl:
            'https://fr.web.img6.acsta.net/medias/nmedia/00/02/54/95/affiche2.jpg',
        prix: 12,
        averageRating: 4.5,
        quantite: 1),
    Book(
        id: 8,
        title: 'Harry Potter et la pierre philosophale',
        author: 'J.K. Rowling',
        description:
            'Dans ce premier tome de la célèbre série de livres pour enfants, Harry Potter découvre qu\'il est un sorcier et commence son voyage à Poudlard.',
        coverUrl:
            'https://i5.walmartimages.com/asr/911d93d0-e3ef-4e4d-88d7-033565f517a5.02928fdbe6a3a116fab4368942e507cf.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff',
        prix: 20,
        averageRating: 4.8,
        quantite: 1),
    Book(
        id: 9,
        title: '1984',
        author: 'George Orwell',
        description:
            'Dans ce roman dystopique classique, le personnage principal Winston Smith se rebelle contre le régime totalitaire qui contrôle tous les aspects de la vie.',
        coverUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTveU9X9FR5ocoSxsOv1jfksuS7n91O7AwI_g&usqp=CAUg',
        prix: 30,
        averageRating: 4.3,
        quantite: 1),
  ];
     String _searchText = '';
     
 List<String> _filteredTitles = [];

  void _onSearchTextChanged(String searchText) {
    setState(() {
      _searchText = searchText.toLowerCase();
      _filteredTitles = bookTitles
          .where((title) =>
              title.toLowerCase().contains(_searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Library for life ..'),
        
      ),
    body: Column(
  children: [
  Container(
  margin: EdgeInsets.symmetric(vertical: 16.0),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
    onChanged: _onSearchTextChanged,
    decoration: InputDecoration(
      hintText: 'Search by title',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: Colors.black,
        ),
      ),
      prefixIcon: Icon(Icons.search),
    ),
  )
  ),
),

Expanded(
  child: Padding(
    padding: EdgeInsets.only(bottom:30.0),
  child: ListView.builder(
    itemCount: _searchText.isEmpty ? books.length : _filteredTitles.length,
    itemBuilder: (context, index) {
      final title = _searchText.isEmpty ? books[index].title : _filteredTitles[index];
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey[800], // couleur de fond en gris foncé
        ),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            books[index].coverUrl,
            width: 50.0,
            height: 80.0,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white, // couleur de texte en blanc
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          subtitle: Text(
            'Auteur: ${books[index].author}',
            style: TextStyle(
              color: Colors.white, // couleur de texte en blanc
              fontSize: 14.0,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.amber[600], // couleur de fond en ambre
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              '${books[index].averageRating}',
              style: TextStyle(
                color: Colors.white, // couleur de texte en blanc
                fontSize: 16.0,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsPage(book: books[index]),
              ),
            );
          },
        ),
      );
    },
  ),
  ),
),



  ],
),

     bottomNavigationBar: CurvedNavigationBar(
 backgroundColor: Colors.white,
          color: Color.fromARGB(255, 21, 199, 86),
          buttonBackgroundColor: Color.fromARGB(255, 21, 199, 86),
          height: 50,
  index: _selectedIndex,
  onTap: (index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PanierPage(),
        ),
      );
    } else if (index == 2) {

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
    Icon(Icons.remove_shopping_cart_outlined, size: 30),
  ],
)

);
  }
  }