import 'package:bookly_app/features/categories/presentation/view/widgets/category_grid.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({
    super.key,
    required this.screenWidth,
    required this.shouldFocusSearch,
  });
  final bool shouldFocusSearch;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: SearchBar(shouldFocusSearch: shouldFocusSearch),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverToBoxAdapter(
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 25)),
          CategoryGrid(screenWidth: screenWidth),
        ],
      ),
    );
  }
}
