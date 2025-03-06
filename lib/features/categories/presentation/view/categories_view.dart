import 'package:bookly_app/features/categories/presentation/view/widgets/categories_view_body.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(child: CategoriesViewBody(screenWidth: screenWidth)),
    );
  }
}
