import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/left_aligned_text.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

            const RegisterForm(),
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
