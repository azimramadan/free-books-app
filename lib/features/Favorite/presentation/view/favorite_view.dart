import 'package:bookly_app/features/Favorite/presentation/view/widgets/favorite_view_body.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Favorites'),
      body: FavoriteViewBody(),
    );
  }
}
