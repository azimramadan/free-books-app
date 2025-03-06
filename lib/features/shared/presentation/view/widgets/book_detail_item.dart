import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailItem extends StatelessWidget {
  const BookDetailItem({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        bookAttributeItem("Author", book.author, context),
        bookAttributeItem("Category", book.category, context),
        bookAttributeItem("Rating", book.rating, context),
        bookAttributeItem("Pricing", "\$25.00", context, isPrice: true),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bookAttributeItem(
    String title,
    String value,
    BuildContext context, {
    bool isPrice = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(text: "$title: "),
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isPrice ? 18 : 16,
                color: isPrice ? Colors.green : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
