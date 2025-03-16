part of 'latest_books_cubit.dart';

@immutable
sealed class LatestBooksState {}

final class LatestBooksInitial extends LatestBooksState {}

class LatestBooksLoading extends LatestBooksState {}

class LatestBooksSuccess extends LatestBooksState {
  final List<Book> books;

  LatestBooksSuccess(this.books);
}

class LatestBooksFailure extends LatestBooksState {
  final String errorMessage;

  LatestBooksFailure(this.errorMessage);
}
