import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 55,
      backgroundColor: kPrimaryColor,
      child: Icon(Icons.person, size: 70, color: Colors.white),
    );
  }
}
