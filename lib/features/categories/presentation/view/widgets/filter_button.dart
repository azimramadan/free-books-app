import 'package:bookly_app/features/categories/presentation/view/widgets/filter_sheet.dart';

import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showFilterSheet(context),
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xffDEDEDE),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(Icons.filter_alt, color: Colors.black87),
      ),
    );
  }
}
