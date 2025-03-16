part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final bool isFavorite;

  FavoriteLoaded({required this.isFavorite});
}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError({required this.message});
}
