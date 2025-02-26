import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: Size(double.infinity, 56),
        backgroundColor: kPrimaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
