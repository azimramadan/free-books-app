import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/welcome_content.dart';
import 'package:flutter/material.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [WelcomeContent(), WelcomeLogo()]);
  }
}

class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.07),
      child: Image.asset(
        Assets.logo,
        width: MediaQuery.of(context).size.width * 0.37,
      ),
    );
  }
}
