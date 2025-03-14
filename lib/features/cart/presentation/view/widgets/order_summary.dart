import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double total;

  const OrderSummary({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          buildSummaryRow("Subtotal", subtotal),
          buildSummaryRow("Shipping", shipping),
          const Divider(color: kPrimaryColor),
          buildSummaryRow("Total", total, fontSize: 20),
        ],
      ),
    );
  }

  Widget buildSummaryRow(String label, double value, {double fontSize = 16}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: label == "Total" ? FontWeight.bold : FontWeight.w400,
            fontSize: fontSize,
          ),
        ),
        Text(
          "\$${value.toStringAsFixed(2)}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      ],
    );
  }
}
