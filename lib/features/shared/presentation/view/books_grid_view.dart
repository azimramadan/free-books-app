import 'package:bookly_app/features/shared/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key, required this.books, required this.viewName});
  final List<Book> books;
  final String viewName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: viewName),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16, top: 8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 أعمدة
            childAspectRatio: 0.6, // نسبة الطول إلى العرض
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookCard(book: books[index]);
          },
        ),
      ),
    );
  }
}
