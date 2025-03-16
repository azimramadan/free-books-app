import 'package:bookly_app/core/network/api_service.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';

class LatestBooksRepository {
  final ApiService _apiService = ApiService();

  Future<List<Book>> getLatestBooks() async {
    final List<dynamic> booksData;
    try {
      booksData = await _apiService.fetchBooks(
        query: "General",
        orderBy: "newest",
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }

    return booksData.map((bookJson) => Book.fromJson(bookJson)).toList();
  }
}
