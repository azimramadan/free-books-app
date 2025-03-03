import 'package:flutter/material.dart';
import 'package:bookly_app/core/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const SectionTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'see more',
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
