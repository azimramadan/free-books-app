import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.obscureText,
  });
  final String hintText;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      cursorColor: kSecondaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffDEDEDE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        ),

        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
