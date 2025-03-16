import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/Favorite/presentation/view_model/favorite_books_cubit/favorite_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_section.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/features/Favorite/data/repositories/favorites_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  // كتب وهمية أثناء التحميل
  static final List<Book> dummyBooks = List.generate(4, (index) => dummyBook);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FavoriteBooksCubit(favoritesRepository: FavoritesRepository())
                ..loadFavoriteBooks(),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<FavoriteBooksCubit, FavoriteBooksState>(
              builder: (context, state) {
                bool isLoading = state is FavoriteBooksLoading;
                bool isError = state is FavoriteBooksError;

                return Skeletonizer(
                  enabled: isLoading, // تفعيل تأثير Skeleton أثناء التحميل
                  child:
                      isError
                          ? Center(
                            child: Text(
                              "Error: ${(state).message}",
                              style: const TextStyle(color: Colors.red),
                            ),
                          )
                          : (state is FavoriteBooksLoaded &&
                              state.books.isEmpty)
                          ? const Center(
                            child: Text("Your favorites list is empty!"),
                          )
                          : FavoriteItemsList(
                            books:
                                isLoading
                                    ? dummyBooks // عرض بيانات وهمية أثناء التحميل
                                    : (state as FavoriteBooksLoaded).books,
                          ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class FavoriteViewBody extends StatelessWidget {
//   const FavoriteViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create:
//           (context) =>
//               FavoriteBooksCubit(favoritesRepository: FavoritesRepository())
//                 ..loadFavoriteBooks(),
//       child: Column(
//         children: [
//           Expanded(
//             child: BlocBuilder<FavoriteBooksCubit, FavoriteBooksState>(
//               builder: (context, state) {
//                 if (state is FavoriteBooksLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(color: kPrimaryColor),
//                   );
//                 } else if (state is FavoriteBooksLoaded) {
//                   return state.books.isEmpty
//                       ? const Center(
//                         child: Text("Your favorites list is empty!"),
//                       )
//                       : FavoriteItemsList(books: state.books);
//                 } else if (state is FavoriteBooksError) {
//                   return Center(child: Text("Error: ${state.message}"));
//                 }
//                 return Container();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class FavoriteItemsList extends StatelessWidget {
  final List<Book> books;

  const FavoriteItemsList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return FavoriteItemWidget(
          book: books[index],
          onRemove: () {
            // إزالة الكتاب من Firestore عند الضغط على زر الإزالة
            context.read<FavoriteBooksCubit>().removeFromFavorites(
              books[index].id,
            );
          },
        );
      },
    );
  }
}

class FavoriteItemWidget extends StatelessWidget {
  final Book book;
  final VoidCallback onRemove;

  const FavoriteItemWidget({
    super.key,
    required this.onRemove,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.kBookDetailsView, extra: book),
      child: Card(
        color: kPrimaryColor,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Hero(
                tag: book.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: book.image,
                    width: 60,
                    height: 90,
                    fit: BoxFit.cover,
                    errorWidget:
                        (context, url, error) => const Icon(
                          Icons.error,
                          size: 40,
                          color: Colors.red,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.authors.isNotEmpty
                          ? book.authors[0]
                          : "Unknown Author",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  _showDeleteConfirmationDialog(context, onRemove);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning_rounded, size: 50, color: kPrimaryColor),
                const SizedBox(height: 15),
                Text(
                  "Delete Book",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Are you sure you want to remove this book from favorites?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          foregroundColor: kPrimaryColor,
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onConfirm(); // تنفيذ الحذف بعد التأكيد
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Delete"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
