import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Text(
          'Happy Reading!',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.02),
          child: IconButton(
            iconSize: screenWidth * 0.08,
            color: kPrimaryColor,
            icon: Icon(Icons.search),
            onPressed: () {
              context.go(AppRouter.kCategoriesView, extra: true);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
