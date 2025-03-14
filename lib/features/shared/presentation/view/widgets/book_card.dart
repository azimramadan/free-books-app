import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_details.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Container(
        height: screenHeight / 3.5,
        width: screenWidth / 2.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffB8B8B8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookImage(imageUrl: book.image),
            Expanded(child: BookDetails(book: book)),
          ],
        ),
      ),
    );
  }
}
