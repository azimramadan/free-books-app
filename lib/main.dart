import 'package:bookly_app/features/auth/presentation/view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FreeBooksApp());
}

class FreeBooksApp extends StatelessWidget {
  const FreeBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
      home: WelcomeView(),
    );
  }
}
