import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/shared/data/repositories/category_books_repository.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_card.dart';
import 'package:bookly_app/features/shared/presentation/view_model/category_books_cubit/category_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key, required this.viewName, required this.books});
  final List<Book> books;
  final String viewName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBooksCubit(CategoryBooksRepository()),
      child: Scaffold(
        appBar: CustomAppBar(title: viewName),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 16,
            top: 8,
          ),
          child: BooksGridViewBody(categoryViewName: viewName),
        ),
      ),
    );
  }
}

class BooksGridViewBody extends StatefulWidget {
  const BooksGridViewBody({super.key, required this.categoryViewName});
  final String categoryViewName;

  @override
  State<BooksGridViewBody> createState() => _BooksGridViewBodyState();
}

class _BooksGridViewBodyState extends State<BooksGridViewBody> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CategoryBooksCubit>(
      context,
    ).fetchBestDealsBooks(category: widget.categoryViewName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBooksCubit, CategoryBooksState>(
      builder: (context, state) {
        if (state is CategoryBooksLoading) {
          return Center(child: CircularProgressIndicator(color: kPrimaryColor));
        } else if (state is CategoryBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          final List<Book> books =
              state is CategoryBooksSuccess ? state.books : [];

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              books[index].category = widget.categoryViewName;
              return BookCard(book: books[index]);
            },
          );
        }
      },
    );
  }
}
