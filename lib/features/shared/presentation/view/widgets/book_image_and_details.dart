import 'package:bookly_app/core/assets.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_detail_item.dart';
import 'package:flutter/material.dart';

class BookImageAndDetails extends StatelessWidget {
  const BookImageAndDetails({
    super.key,
    required this.book,
    required this.screenWidth,
  });

  final Book book;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    double imageSize = screenWidth * 0.35;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Assets.testImage,
            width: imageSize,
            height: imageSize * 1.55,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: BookDetailItem(book: book)),
      ],
    );
  }
}
