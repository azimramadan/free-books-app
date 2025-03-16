import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: kPrimaryColor,
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),

      child: NavigationBar(
        selectedIndex: getSelectedIndex(context),
        onDestinationSelected: (index) => onItemTapped(index, context),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: kPrimaryColor),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category, color: kPrimaryColor),
            selectedIcon: Icon(Icons.category, color: Colors.white),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite, color: kPrimaryColor),
            selectedIcon: Icon(Icons.favorite, color: Colors.white),
            label: 'Favorite',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: kPrimaryColor),
            selectedIcon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  int getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRouter.kCategoriesView)) return 1;
    if (location.startsWith(AppRouter.kFavoriteView)) return 2;
    if (location.startsWith(AppRouter.kAccountView)) return 3;
    return 0;
  }

  void onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppRouter.kHomeView);
        break;
      case 1:
        context.go(AppRouter.kCategoriesView);
        break;
      case 2:
        context.go(AppRouter.kFavoriteView);
        break;
      case 3:
        context.go(AppRouter.kAccountView);
        break;
    }
  }
}
