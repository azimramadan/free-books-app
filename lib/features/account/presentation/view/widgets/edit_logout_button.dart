import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class EditLogoutButton extends StatelessWidget {
  const EditLogoutButton({
    super.key,
    required this.logOutOnPressed,
    required this.buttonText,
  });

  final void Function()? logOutOnPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        backgroundColor: buttonText == 'Log out' ? Colors.white : kPrimaryColor,
      ),
      onPressed: logOutOnPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonText == 'Log out' ? kPrimaryColor : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
