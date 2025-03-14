import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/left_aligned_text.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/sign_in_form.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const LeftAlignedText(text: 'Please fill your details to login.'),

            const SizedBox(height: 32),
            const SignInForm(),
            const SizedBox(height: 24),

            const Text(
              'forgot password?',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            SizedBox(height: (MediaQuery.of(context).size.height - 486.4)),
            AuthNavigationText(
              text: 'New member? ',
              actionText: 'Register',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kRegisterView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
