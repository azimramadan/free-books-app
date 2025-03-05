import 'package:bookly_app/core/assets.dart';
import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailVieww extends StatelessWidget {
  const BookDetailVieww({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor,
          size: screenWidth * 0.067,
        ),
        title: Text(
          book.category,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),

        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.02),
            child: IconButton(
              iconSize: screenWidth * 0.067,
              color: kPrimaryColor,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double paddingValue = screenWidth * 0.05;
          double imageSize = screenWidth * 0.35;
          return Padding(
            padding: EdgeInsets.all(paddingValue),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
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
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Description:",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

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
