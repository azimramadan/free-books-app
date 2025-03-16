part of 'favorite_books_cubit.dart';

@immutable
sealed class FavoriteBooksState {}

final class FavoriteBooksInitial extends FavoriteBooksState {}

class FavoriteBooksLoading extends FavoriteBooksState {}

class FavoriteBooksLoaded extends FavoriteBooksState {
  final List<Book> books;

  FavoriteBooksLoaded({required this.books});
}

class FavoriteBooksError extends FavoriteBooksState {
  final String message;

  FavoriteBooksError({required this.message});
}
