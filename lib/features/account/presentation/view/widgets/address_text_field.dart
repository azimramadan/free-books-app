import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key, required this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 2,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: 'Enter your new address',
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }
}
