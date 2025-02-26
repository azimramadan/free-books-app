import 'package:bookly_app/features/auth/presentation/view/register_view.dart';
import 'package:bookly_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:bookly_app/features/auth/presentation/view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kRegisterView = '/RegisterView';
  static final kSignInView = '/SignInView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeView();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: kSignInView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInView();
        },
      ),
    ],
  );
}
