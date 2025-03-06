import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_detail_view_app_bar.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_detail_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: BookDetailViewAppBar(screenWidth: screenWidth, book: book),
      body: BookDetailViewBody(book: book),
    );
  }
}
