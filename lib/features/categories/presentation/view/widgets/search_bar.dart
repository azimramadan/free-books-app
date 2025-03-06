import 'package:bookly_app/features/categories/presentation/view/widgets/filter_button.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchTextField()),
        SizedBox(width: 10),
        FilterButton(),
      ],
    );
  }
}
