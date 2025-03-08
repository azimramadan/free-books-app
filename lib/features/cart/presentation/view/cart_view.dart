import 'package:bookly_app/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      body: CartViewBody(),
    );
  }
}
