import 'package:bookly_app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FreeBooksApp());
}

class FreeBooksApp extends StatelessWidget {
  const FreeBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
      routerConfig: AppRouter.router,
    );
  }
}
