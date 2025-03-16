import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/shared/data/repositories/favorites_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesRepositoryShared favoritesRepository;
  final String bookId;

  FavoriteCubit({required this.favoritesRepository, required this.bookId})
    : super(FavoriteInitial());

  Future<void> loadFavoriteStatus() async {
    try {
      emit(FavoriteLoading());
      final isFavorite = await favoritesRepository.isBookFavorite(bookId);
      emit(FavoriteLoaded(isFavorite: isFavorite));
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite() async {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;
      final newState = !currentState.isFavorite;

      emit(FavoriteLoaded(isFavorite: newState));

      try {
        await favoritesRepository.toggleFavorite(
          bookId,
          currentState.isFavorite,
        );
      } catch (e) {
        emit(FavoriteError(message: e.toString()));
      }
    }
  }
}
