import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class PasswordTextFormFieldWithIcon extends StatefulWidget {
  const PasswordTextFormFieldWithIcon({
    super.key,
    this.controller,
    this.validator,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<PasswordTextFormFieldWithIcon> createState() =>
      _PasswordTextFormFieldWithIconState();
}

class _PasswordTextFormFieldWithIconState
    extends State<PasswordTextFormFieldWithIcon> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: isObscure,
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
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        ),
      ),
    );
  }
}
