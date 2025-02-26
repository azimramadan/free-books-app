import 'package:bookly_app/core/assets.dart';
import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_elevated_button%20.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/tap_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WelcomeBackground(),

        Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Read more and stress less with our online book shopping app. Shop from h you are and discover titles that you love. Happy reading!',
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomElevatedButton(),
        ),
        Spacer(flex: 1),

        TapTextButton(
          actionText: 'Register',
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSignInView);
          },
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

class WelcomeBackground extends StatelessWidget {
  const WelcomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.welcomeBookCover),
        ),
      ),
    );
  }
}
