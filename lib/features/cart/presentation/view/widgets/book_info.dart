import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  final String title;
  final String author;

  const BookInfo({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Text(author, style: TextStyle(color: Colors.grey[500])),
      ],
    );
  }
}
