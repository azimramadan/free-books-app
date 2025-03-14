import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_description.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_image_and_details.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_title.dart';
import 'package:flutter/material.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double paddingValue = screenWidth * 0.05;
        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: paddingValue),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: paddingValue),
                BookTitle(title: book.title),
                const SizedBox(height: 10),
                BookImageAndDetails(book: book, screenWidth: screenWidth),
                const SizedBox(height: 20),
                BookDescription(description: book.description),
              ],
            ),
          ),
        );
      },
    );
  }
}
