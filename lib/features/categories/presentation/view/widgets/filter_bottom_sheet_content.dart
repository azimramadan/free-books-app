import 'package:bookly_app/features/categories/presentation/view/widgets/filter_header.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/filter_type_section.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/price_range_section.dart';
import 'package:flutter/cupertino.dart';

class FilterBottomSheetContent extends StatefulWidget {
  const FilterBottomSheetContent({super.key});

  @override
  State<FilterBottomSheetContent> createState() =>
      _FilterBottomSheetContentState();
}

class _FilterBottomSheetContentState extends State<FilterBottomSheetContent> {
  bool isPaperBackSelected = false;
  bool isHardcoverSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterHeader(
          onTapReset: () {
            setState(() {
              isPaperBackSelected = false;
              isHardcoverSelected = false;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
        FilterTypeSection(
          isPaperBackSelected: isPaperBackSelected,
          isHardcoverSelected: isHardcoverSelected,
          onHardcoverSelected: (bool value) {
            setState(() {
              isHardcoverSelected = value;
            });
          },
          onPaperBackSelected: (bool value) {
            setState(() {
              isPaperBackSelected = value;
            });
          },
        ),
        const SizedBox(height: 20),
        PriceRangeSection(),
      ],
    );
  }
}
