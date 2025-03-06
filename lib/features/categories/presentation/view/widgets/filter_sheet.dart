import 'package:bookly_app/features/categories/presentation/view/widgets/custom_slider.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/filter_bottom_sheet_content.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/filter_header.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/filter_type_section.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/price_range_section.dart';

import 'package:flutter/material.dart';

void showFilterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return FilterBottomSheet();
        },
      );
    },
  );
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FilterBottomSheetContent(),
    );
  }
}
