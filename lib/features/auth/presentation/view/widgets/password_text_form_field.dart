import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({super.key});

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

        hintText: "Password",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: kSecondaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(true ? Icons.visibility : Icons.visibility_off),
          onPressed: () {},
        ),
      ),
    );
  }
}
