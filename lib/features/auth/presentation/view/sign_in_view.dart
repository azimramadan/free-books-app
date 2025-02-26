import 'package:bookly_app/features/auth/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Get Started'),
      body: SignInViewBody(),
    );
  }
}
