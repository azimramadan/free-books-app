import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.logOutOnPressed});

  final void Function()? logOutOnPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        backgroundColor: kPrimaryColor,
      ),
      onPressed: logOutOnPressed,
      child: Text(
        'Log out',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
