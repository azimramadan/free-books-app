import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/auth/data/repositories/register_repository%20.dart';
import 'package:bookly_app/features/auth/presentation/view_model/auth_register_cubit/auth_register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تأكد من تهيئة الـ Widgets
  await Firebase.initializeApp(); // تهيئة Firebase
  runApp(const FreeBooksApp());
}

class FreeBooksApp extends StatelessWidget {
  const FreeBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  AuthRegisterCubit(registerRepository: RegisterRepository()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
