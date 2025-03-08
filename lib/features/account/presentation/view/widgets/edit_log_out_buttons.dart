import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/account/presentation/view/widgets/edit_logout_button.dart';
import 'package:flutter/material.dart';

class EditLogoutButtons extends StatelessWidget {
  const EditLogoutButtons({
    super.key,
    this.logOutOnPressed,
    this.editOnPressed,
  });
  final void Function()? logOutOnPressed;
  final void Function()? editOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EditLogoutButton(
            logOutOnPressed: editOnPressed,
            buttonText: 'Edit',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EditLogoutButton(
            logOutOnPressed: logOutOnPressed,
            buttonText: 'Log out',
          ),
        ),
      ],
    );
  }
}
