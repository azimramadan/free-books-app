import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookDetailViewAppBar({
    super.key,
    required this.screenWidth,
    required this.bookCategory,
  });

  final double screenWidth;
  final String bookCategory;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: kPrimaryColor, size: screenWidth * 0.067),
      title: Text(
        bookCategory,
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
            onPressed: () {
              context.push(AppRouter.kCartView);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
