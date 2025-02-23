import 'package:bookly_app/core/assets.dart';
import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WelcomeViewBody());
  }
}
