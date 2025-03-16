import 'dart:math';

import 'package:bookly_app/core/network/api_service.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';

class BestDealsBooksRepository {
  final ApiService _apiService = ApiService();

  final List<String> _queries = [
    "programming",
    "coding",
    "computer science",
    "software development",
    "software engineering",
    "computational thinking",
  ];

  Future<List<Book>> getBestDealsBooks() async {
    final String randomQuery = _queries[Random().nextInt(_queries.length)];

    final List<dynamic> freeBooksData;
    try {
      freeBooksData = await _apiService.fetchBooks(
        query: randomQuery,
        freeOnly: true,
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }

    return freeBooksData.map((bookJson) => Book.fromJson(bookJson)).toList();
  }
}
