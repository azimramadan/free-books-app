class Book {
  final String id;
  final String image;
  final String title;
  final List<String> authors;
  final double? price;
  final double discount;
  final List<String> genres;
  final String description;
  String category;
  final double rating;
  final String? downloadLinkPdf;
  final String? webReaderLink;

  Book({
    required this.id,
    required this.image,
    required this.title,
    required this.authors,
    this.price,
    required this.discount,
    required this.genres,
    required this.description,
    required this.category,
    required this.rating,
    required this.downloadLinkPdf,
    required this.webReaderLink,
  });

  // تحويل الـ JSON إلى كائن Book
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      image: json['volumeInfo']?['imageLinks']?['thumbnail'] ?? '',
      title: json['volumeInfo']?['title'] ?? 'Unknown Title',
      authors:
          (json['volumeInfo']?['authors'] as List<dynamic>?)
              ?.map((author) => author.toString())
              .toList() ??
          ['Unknown Author'],
      price:
          json['saleInfo']?['listPrice":']?['amount'] != null
              ? (json['saleInfo']['listPrice']['amount'] as num).toDouble()
              : 0,
      discount: 0,
      genres:
          (json['volumeInfo']?['categories'] as List<dynamic>?)
              ?.map((genre) => genre.toString())
              .toList() ??
          ['Unknown Genre'],
      description:
          json['volumeInfo']?['description'] ?? 'No description available',
      category:
          (json['volumeInfo']?['printType'] == null) ||
                  (json['volumeInfo']?['printType'] == 'BOOK')
              ? 'Unknown Category'
              : json['volumeInfo']?['printType'],
      rating:
          json['volumeInfo']?['averageRating'] != null
              ? (json['volumeInfo']['averageRating'] as num).toDouble()
              : 0.0,

      downloadLinkPdf:
          json['accessInfo']?['pdf']?['isAvailable'] == true
              ? json['accessInfo']['pdf']['downloadLink']
              : null,
      webReaderLink: json['accessInfo']?['webReaderLink'],
    );
  }

  // تحويل كائن Book إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'authors': authors,
      'price': price,
      'discount': discount,
      'genres': genres,
      'description': description,
      'category': category,
      'rating': rating,
      'downloadLinkPdf': downloadLinkPdf,
      'webReaderLink': webReaderLink,
    };
  }
}
