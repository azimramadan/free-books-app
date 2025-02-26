import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const CustomAppBar(title: 'Register'));
  }
}
