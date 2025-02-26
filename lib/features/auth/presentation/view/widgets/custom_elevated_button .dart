import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: Size(double.infinity, 56),
        backgroundColor: kPrimaryColor,
      ),
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kSignInView);
      },
      child: Text(
        'Get Started',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
