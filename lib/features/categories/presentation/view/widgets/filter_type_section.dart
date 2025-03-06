import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/custom_filter_chip.dart';
import 'package:flutter/material.dart';

class FilterTypeSection extends StatelessWidget {
  const FilterTypeSection({
    super.key,
    required this.isPaperBackSelected,
    required this.isHardcoverSelected,
    this.onPaperBackSelected,
    this.onHardcoverSelected,
  });

  final bool isPaperBackSelected;
  final bool isHardcoverSelected;
  final void Function(bool)? onPaperBackSelected;
  final void Function(bool)? onHardcoverSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomFilterChip(
          label: 'Paper Back',
          isSelected: isPaperBackSelected,
          onSelected: onPaperBackSelected,
        ),
        SizedBox(width: 10),
        CustomFilterChip(
          label: 'Hardcover',
          isSelected: isHardcoverSelected,
          onSelected: onHardcoverSelected,
        ),
      ],
    );
  }
}
