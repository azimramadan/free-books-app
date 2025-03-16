part of 'best_deals_books_cubit.dart';

@immutable
sealed class BestDealsBooksState {}

final class BestDealsBooksInitial extends BestDealsBooksState {}

class BestDealsBooksLoading extends BestDealsBooksState {}

class BestDealsBooksSuccess extends BestDealsBooksState {
  final List<Book> books;

  BestDealsBooksSuccess(this.books);
}

class BestDealsBooksFailure extends BestDealsBooksState {
  final String errorMessage;

  BestDealsBooksFailure(this.errorMessage);
}
