part of 'top_books_cubit.dart';

@immutable
sealed class TopBooksState {}

final class TopBooksInitial extends TopBooksState {}

class TopBooksLoading extends TopBooksState {}

class TopBooksSuccess extends TopBooksState {
  final List<Book> books;

  TopBooksSuccess(this.books);
}

class TopBooksFailure extends TopBooksState {
  final String errorMessage;

  TopBooksFailure(this.errorMessage);
}
