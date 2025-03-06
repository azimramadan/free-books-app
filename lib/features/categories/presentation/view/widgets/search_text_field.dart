import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      // validator: validator,
      // obscureText: obscureText ?? false,
      cursorColor: kSecondaryColor,
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () {},
          child: Icon(Icons.search, color: kSecondaryColor),
        ),
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

        hintText: 'Search title/author/ISBN no',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
