import 'package:bookly_app/core/network/api_service.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';

class FreeBooksRepository {
  final ApiService _apiService = ApiService();

  Future<List<Book>> getFreeBooks() async {
    final List<dynamic> booksData;
    try {
      booksData = await _apiService.fetchBooks(
        query: "General",
        freeOnly: true,
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }

    return booksData.map((bookJson) => Book.fromJson(bookJson)).toList();
  }
}
