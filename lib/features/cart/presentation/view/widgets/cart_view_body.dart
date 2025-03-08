import 'package:bookly_app/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:bookly_app/features/cart/presentation/view/widgets/checkout_button.dart';
import 'package:bookly_app/features/cart/presentation/view/widgets/order_summary.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:
              books.isEmpty
                  ? const Center(child: Text("Your cart is empty!"))
                  : CartItemsList(),
        ),
        if (books.isNotEmpty) ...[CartSummary()],
      ],
    );
  }
}

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return CartItemWidget(
          book: books[index],
          onQuantityChange: (p0) {},
          onRemove: () {},
        );
      },
    );
  }
}

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        OrderSummary(subtotal: 50, shipping: 10, total: 60),
        const CheckoutButton(),
      ],
    );
  }
}
