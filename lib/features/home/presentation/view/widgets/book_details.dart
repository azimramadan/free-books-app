import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_details_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: Colors.black,
      ),
      padding: EdgeInsets.all(8),

      child: BookDetailsContent(book: book),
    );
  }
}
