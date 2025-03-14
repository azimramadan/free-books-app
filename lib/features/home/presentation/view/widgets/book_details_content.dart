import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsContent extends StatelessWidget {
  const BookDetailsContent({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.genres[0],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white70,
            fontSize: MediaQuery.of(context).size.width * .028,
          ),
        ),
        SizedBox(height: 2),
        Text(
          book.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * .035,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          book.authors[0],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white70,
            fontSize: MediaQuery.of(context).size.width * .028,
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              book.price == 0 ? 'Free' : "\$${book.price}",
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * .035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
