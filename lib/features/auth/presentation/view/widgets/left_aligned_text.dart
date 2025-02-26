import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class LeftAlignedText extends StatelessWidget {
  const LeftAlignedText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: kSecondaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
