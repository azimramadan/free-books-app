import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/cart/presentation/view/widgets/book_info.dart';
import 'package:bookly_app/features/cart/presentation/view/widgets/quantity_control.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartItemWidget extends StatelessWidget {
  final Book book;
  final Function(int) onQuantityChange;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.onQuantityChange,
    required this.onRemove,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Card(
        color: kPrimaryColor,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                book.image,
                width: 60,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookInfo(title: book.title, author: book.author),
                    const SizedBox(height: 8),
                    QuantityControl(
                      quantity: 1,
                      price: 10,
                      onQuantityChange: onQuantityChange,
                      onRemove: onRemove,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
