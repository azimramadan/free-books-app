import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 56),
          backgroundColor: kPrimaryColor,
        ),
        onPressed: () {
          ////////////////////////////////////////////////////////////////////////////////////////////////////
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SignInView();
              },
            ),
          );
          ////////////////////////////////////////////////////////////////////////////////////////////////////
        },
        child: Text(
          'Get Started',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
