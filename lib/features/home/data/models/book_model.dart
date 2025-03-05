class Book {
  final String id;
  final String image;
  final String title;
  final String author;
  final String price;
  final String discount;
  final String genre;
  final String description;
  final String category;

  final String rating;

  Book({
    required this.id,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.discount,
    required this.genre,
    required this.description,
    required this.category,
    required this.rating,
  });

  // تحويل الـ JSON إلى كائن Book
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      price: json['price'] ?? '',
      discount: json['discount'] ?? '',
      genre: json['genre'] ?? 'Unknown',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      rating: json['rating'] ?? '',
    );
  }

  // تحويل كائن Book إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'author': author,
      'price': price,
      'discount': discount,
      'genre': genre,
      'description': description,
      'category': category,
      'rating': rating,
    };
  }
}
