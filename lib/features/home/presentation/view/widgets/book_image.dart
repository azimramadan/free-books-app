import 'package:flutter/cupertino.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),

          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
