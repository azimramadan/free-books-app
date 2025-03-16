import 'package:bookly_app/core/network/api_service.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ApiService _apiService = ApiService();

  Future<List<String>> getFavoriteBookIds() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception("User not logged in");

    final docSnapshot = await _firestore.collection("users").doc(userId).get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      return List<String>.from(data?["favorites"] ?? []);
    }
    return [];
  }

  Future<List<Book>> getFavoriteBooks() async {
    try {
      final bookIds = await getFavoriteBookIds();
      if (bookIds.isEmpty) return [];

      final booksJson = await _apiService.fetchBooksByIds(bookIds);
      return booksJson.map((json) => Book.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to fetch favorite books: $e");
    }
  }
}
