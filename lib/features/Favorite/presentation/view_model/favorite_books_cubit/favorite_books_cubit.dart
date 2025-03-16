import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Favorite/data/repositories/favorites_repository.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'favorite_books_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBooksState> {
  final FavoritesRepository favoritesRepository;

  FavoriteBooksCubit({required this.favoritesRepository})
    : super(FavoriteBooksLoading());

  Future<void> loadFavoriteBooks() async {
    try {
      emit(FavoriteBooksLoading());

      List<Book> books = await favoritesRepository.getFavoriteBooks();

      emit(FavoriteBooksLoaded(books: books));
    } catch (e) {
      emit(FavoriteBooksError(message: e.toString()));
    }
  }

  Future<void> removeFromFavorites(String bookId) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) throw Exception("User not logged in");

      // حذف معرف الكتاب من Firestore
      await FirebaseFirestore.instance.collection("users").doc(userId).update({
        "favorites": FieldValue.arrayRemove([bookId]),
      });

      // تحديث الحالة مباشرة بدون إعادة تحميل كل البيانات
      if (state is FavoriteBooksLoaded) {
        final currentState = state as FavoriteBooksLoaded;
        final updatedBooks =
            currentState.books.where((book) => book.id != bookId).toList();
        emit(FavoriteBooksLoaded(books: updatedBooks));
      }
    } catch (e) {
      emit(FavoriteBooksError(message: e.toString()));
    }
  }
}
