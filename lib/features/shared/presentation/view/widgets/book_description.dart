import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description:",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
