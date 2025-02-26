import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class TapTextButton extends StatelessWidget {
  const TapTextButton({
    super.key,
    required this.actionText,
    required this.onTap,
  });
  final String actionText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        actionText,
        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
