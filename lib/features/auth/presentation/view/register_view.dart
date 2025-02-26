import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_elevated_button%20.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/left_aligned_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Register'),
      body: const RegisterViewBody(),
    );
  }
}

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),
            LeftAlignedText(text: 'Please fill your details to signup.'),
            const SizedBox(height: 32),
            const CustomTextFormField(hintText: 'Username'),
            const SizedBox(height: 24),
            const CustomTextFormField(hintText: 'Email'),
            const SizedBox(height: 24),
            const CustomTextFormField(hintText: 'Password'),
            const SizedBox(height: 24),
            const CustomTextFormField(hintText: 'Confirm Password'),
            const SizedBox(height: 32),
            CustomElevatedButton(onPressed: () {}, text: 'Register'),
            const SizedBox(height: 113),
            AuthNavigationText(
              text: 'Already a member? ',
              actionText: 'SignIn',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignInView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
