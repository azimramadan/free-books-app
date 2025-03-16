import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/auth/data/repositories/register_repository%20.dart';
import 'package:bookly_app/features/auth/data/repositories/sign_in_repository%20.dart';
import 'package:bookly_app/features/auth/presentation/view_model/auth_register_cubit/auth_register_cubit.dart';
import 'package:bookly_app/features/auth/presentation/view_model/auth_sign_in_cubit/auth_sign_in_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('first_time') ?? true;

  if (isFirstTime) {
    await prefs.setBool('first_time', false);
  }
  await dotenv.load(fileName: ".env");
  runApp(FreeBooksApp(isFirstTime: isFirstTime));
}

class FreeBooksApp extends StatelessWidget {
  const FreeBooksApp({super.key, required this.isFirstTime});
  final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  AuthRegisterCubit(registerRepository: RegisterRepository()),
        ),
        BlocProvider(
          create:
              (context) =>
                  AuthSignInCubit(signInRepository: SignInRepository()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.openSans().fontFamily,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: AppRouter.createRouter(isFirstTime),
      ),
    );
  }
}
