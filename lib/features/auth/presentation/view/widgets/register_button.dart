import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Register',
        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
