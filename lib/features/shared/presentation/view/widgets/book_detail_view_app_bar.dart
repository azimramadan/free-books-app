import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/shared/data/repositories/favorites_repository.dart';
import 'package:bookly_app/features/shared/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookDetailViewAppBar({
    super.key,
    required this.screenWidth,
    required this.bookCategory,
    required this.bookId,
  });

  final double screenWidth;
  final String bookCategory;
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FavoriteCubit(
            favoritesRepository: FavoritesRepositoryShared(),
            bookId: bookId,
          )..loadFavoriteStatus(),
      child: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: screenWidth * 0.067,
        ),
        title: Text(
          bookCategory,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.02),
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                bool isFavorite = false;
                if (state is FavoriteLoaded) {
                  isFavorite = state.isFavorite;
                }

                return IconButton(
                  iconSize: screenWidth * 0.067,
                  color: kPrimaryColor,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    context.read<FavoriteCubit>().toggleFavorite();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorite
                              ? "Removed from Favorites"
                              : "Added to Favorites",
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.black87,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
