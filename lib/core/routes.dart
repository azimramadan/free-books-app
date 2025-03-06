import 'package:bookly_app/core/presentation/widgets/main_navigation_bar.dart';
import 'package:bookly_app/features/account/presentation/view/account_view.dart';
import 'package:bookly_app/features/auth/presentation/view/register_view.dart';
import 'package:bookly_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:bookly_app/features/auth/presentation/view/welcome_view.dart';
import 'package:bookly_app/features/cart/presentation/view/cart_view.dart';
import 'package:bookly_app/features/categories/presentation/view/categories_view.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/home/presentation/view/top_books_view.dart';
import 'package:bookly_app/features/shared/presentation/view/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kRegisterView = '/RegisterView';
  static final kSignInView = '/SignInView';
  static final kHomeView = '/HomeView';
  static final kAccountView = '/AccountView';
  static final kCartView = '/CartView';
  static final kCategoriesView = '/CategoriesVieww';

  static final kBookDetailsView = '/BookDetailsView';
  static final kTopBooksView = '/TopBooksView';

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
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: MainNavigationBar(),
          );
        },
        routes: [
          GoRoute(
            path: kBookDetailsView,
            builder: (context, state) {
              final book = state.extra as Book;
              return BookDetailView(book: book);
            },
          ),
          GoRoute(
            path: kTopBooksView,
            builder: (context, state) {
              final books = state.extra as List<Book>;
              return TopBooksView(books: books);
            },
          ),

          GoRoute(
            path: kHomeView,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
          GoRoute(
            path: kCategoriesView,
            builder: (BuildContext context, GoRouterState state) {
              return const CategoriesView();
            },
          ),
          GoRoute(
            path: kCartView,
            builder: (BuildContext context, GoRouterState state) {
              return const CartView();
            },
          ),
          GoRoute(
            path: kAccountView,
            builder: (BuildContext context, GoRouterState state) {
              return const AccountView();
            },
          ),
        ],
      ),
    ],
  );
}

// class AppRouter {
//   static final GoRouter router = GoRouter(
//     initialLocation: '/onboarding',
//     routes: [
//       /// 🟢 صفحة الاستقبال (Onboarding)
//       GoRoute(path: '/onboarding', builder: (context, state) => OnboardingView()),

//       /// 🔹 تسجيل الدخول والتسجيل
//       GoRoute(path: '/login', builder: (context, state) => LoginView()),
//       GoRoute(path: '/register', builder: (context, state) => RegisterView()),

//       /// 🏠 التطبيق الرئيسي بعد تسجيل الدخول
//       ShellRoute(
//         builder: (context, state, child) {
//           return Scaffold(
//             body: child,
//             bottomNavigationBar: MainNavigationBar(),
//           );
//         },
//         routes: [
//           GoRoute(
//             path: '/home',
//             builder: (context, state) {
//               final authService = Provider.of<AuthService>(context, listen: false);
//               return authService.isLoggedIn ? HomeView() : LoginView();
//             },
//           ),
//           GoRoute(path: '/categories', builder: (context, state) => CategoriesView()),
//           GoRoute(path: '/cart', builder: (context, state) => CartView()),
//           GoRoute(path: '/profile', builder: (context, state) => ProfileView()),
//         ],
//       ),
//     ],
//   );
// }
