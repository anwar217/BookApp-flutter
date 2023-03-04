class Book {
  final int id;
  final String title;
  final String author;
  final double prix;
  final String description;
  final String coverUrl;
  final double averageRating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.prix,
    required this.description,
    required this.coverUrl,
    required this.averageRating,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      prix: json['prix'],
      description: json['description'],
      coverUrl: json['cover_url'],
      averageRating: json['average_rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'prix': prix,
      'description': description,
      'cover_url': coverUrl,
      'average_rating': averageRating,
    };
  }
}
