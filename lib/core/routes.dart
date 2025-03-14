import 'package:bookly_app/core/presentation/widgets/main_navigation_bar.dart';
import 'package:bookly_app/core/services/firebase_service.dart';
import 'package:bookly_app/features/account/presentation/view/account_view.dart';
import 'package:bookly_app/features/auth/presentation/view/register_view.dart';
import 'package:bookly_app/features/auth/presentation/view/sign_in_view.dart';
import 'package:bookly_app/features/auth/presentation/view/welcome_view.dart';
import 'package:bookly_app/features/cart/presentation/view/cart_view.dart';
import 'package:bookly_app/features/categories/presentation/view/categories_view.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/shared/presentation/view/books_grid_view.dart';
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
  static final kBooksGridView = '/BooksGridView';
  static final kWelcomeView = '/WelcomeView';

  static GoRouter createRouter(bool isFirstTime) {
    return GoRouter(
      initialLocation:
          isFirstTime
              ? kWelcomeView
              : FirebaseService().isUserLoggedIn()
              ? kHomeView
              : kSignInView,
      routes: [
        GoRoute(
          path: kWelcomeView,
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
              path: kBooksGridView,
              builder: (context, state) {
                final data = state.extra as List;
                final books = data[0] as List<Book>;
                final viewName = data[1] as String;
                return BooksGridView(books: books, viewName: viewName);
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
                final bool shouldFocusSearch = state.extra as bool? ?? false;
                return CategoriesView(shouldFocusSearch: shouldFocusSearch);
              },
            ),
            GoRoute(
              path: kCartView,
              builder: (BuildContext context, GoRouterState state) {
                return CartView();
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
}
