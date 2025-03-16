part of 'category_books_cubit.dart';

@immutable
sealed class CategoryBooksState {}

final class CategoryBooksInitial extends CategoryBooksState {}

class CategoryBooksLoading extends CategoryBooksState {}

class CategoryBooksSuccess extends CategoryBooksState {
  final List<Book> books;

  CategoryBooksSuccess(this.books);
}

class CategoryBooksFailure extends CategoryBooksState {
  final String errorMessage;

  CategoryBooksFailure(this.errorMessage);
}
