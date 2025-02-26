import 'package:bookly_app/features/auth/presentation/view/widgets/tap_text_button.dart';
import 'package:flutter/material.dart';

class AuthNavigationText extends StatelessWidget {
  const AuthNavigationText({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });
  final String text;
  final String actionText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        TapTextButton(actionText: actionText, onTap: onTap),
      ],
    );
  }
}
