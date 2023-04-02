class Book {
  final int id;
  final String title;
  final String author;
  final double prix;
  final String description;
  final String coverUrl;
  late final double averageRating;
  int quantite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.prix,
    required this.description,
    required this.coverUrl,
    required this.averageRating,
    required this.quantite,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverUrl': coverUrl,
      'description': description,
      'prix': prix,
      'averageRating':averageRating,
      'quantite': quantite,
    };
  }

  void ajouterQuantite() {
    this.quantite += 1;
  }

  void dininuerQuantite() {
    if (this.quantite > 1) {
      this.quantite -= 1;
    }
  }

 
}
