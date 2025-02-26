import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kSecondaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffDEDEDE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        ),

        hintText: "Username/email",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
