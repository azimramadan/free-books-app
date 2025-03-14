import 'package:bookly_app/features/account/presentation/view/widgets/account_view_body.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Account'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: AccountViewBody(),
      ),
    );
  }
}
