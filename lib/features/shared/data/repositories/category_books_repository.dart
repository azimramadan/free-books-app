import 'package:bookly_app/core/network/api_service.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';

class CategoryBooksRepository {
  final ApiService _apiService = ApiService();

  Future<List<Book>> getBooksByCategory({required String category}) async {
    final List<dynamic> freeBooksData;
    try {
      freeBooksData = await _apiService.fetchBooks(
        query: category,
        freeOnly: true,
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }

    return freeBooksData.map((bookJson) => Book.fromJson(bookJson)).toList();
  }
}
