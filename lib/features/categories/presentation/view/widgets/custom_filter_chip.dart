import 'package:bookly_app/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    this.onSelected,
  });

  final String label;
  final bool isSelected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: isSelected,
      selectedColor: kPrimaryColor,
      checkmarkColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: kPrimaryColor, width: 1.2),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onSelected: onSelected,
    );
  }
}
