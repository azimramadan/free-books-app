import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/category_card.dart';
import 'package:flutter/cupertino.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CategoryCard(
          title: categories.keys.elementAt(index),
          imageUrl: categories.values.elementAt(index),
        );
      }, childCount: categories.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth > 600 ? 4 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        childAspectRatio: 2.5 / 2,
      ),
    );
  }
}

Map<String, String> categories = {
  'Non-fiction': Assets.iconCategory_1,
  'Classics': Assets.iconCategory_2,
  'Fantasy': Assets.iconCategory_3,
  'Young Adult': Assets.iconCategory_4,
  'Crime': Assets.iconCategory_1,
  'Horror': Assets.iconCategory_2,
  'Sci-fi': Assets.iconCategory_3,
  'Drama': Assets.iconCategory_4,
};
