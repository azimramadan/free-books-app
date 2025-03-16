part of 'free_books_cubit.dart';

@immutable
sealed class FreeBooksState {}

final class FreeBooksInitial extends FreeBooksState {}

class FreeBooksLoading extends FreeBooksState {}

class FreeBooksSuccess extends FreeBooksState {
  final List<Book> books;

  FreeBooksSuccess(this.books);
}

class FreeBooksFailure extends FreeBooksState {
  final String errorMessage;

  FreeBooksFailure(this.errorMessage);
}
