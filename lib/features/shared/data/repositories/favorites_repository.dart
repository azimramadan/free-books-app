import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesRepositoryShared {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> toggleFavorite(String bookId, bool isFavorite) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception("User not logged in");

    final userFavoritesRef = _firestore.collection("users").doc(userId);

    if (isFavorite) {
      await userFavoritesRef.update({
        "favorites": FieldValue.arrayRemove([bookId]),
      });
    } else {
      await userFavoritesRef.update({
        "favorites": FieldValue.arrayUnion([bookId]),
      });
    }
  }

  Future<bool> isBookFavorite(String bookId) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception("User not logged in");

    final userDoc = await _firestore.collection("users").doc(userId).get();
    final favorites = List<String>.from(userDoc.data()?["favorites"] ?? []);

    return favorites.contains(bookId);
  }
}
