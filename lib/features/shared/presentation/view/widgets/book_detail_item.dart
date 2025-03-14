import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/add_to_cart_butto.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/free_book_actions.dart';
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
        bookAttributeItem("Author", book.authors[0], context),
        bookAttributeItem("Category", book.category, context),
        bookAttributeItem("Rating", book.rating.toString(), context),
        bookAttributeItem(
          "Pricing",
          book.price == 0 ? 'free' : book.price.toString(),
          context,
          isPrice: true,
        ),
        book.price == 0
            ? FreeBookActions(
              downloadLinkPdf: book.downloadLinkPdf,
              webReaderLink: book.webReaderLink,
            )
            : AddToCartButton(),
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
