import 'package:bookly_app/features/cart/presentation/view/widgets/quantity_button.dart';
import 'package:flutter/material.dart';

class QuantityControl extends StatelessWidget {
  final int quantity;
  final double price;
  final Function(int) onQuantityChange;
  final VoidCallback onRemove;

  const QuantityControl({
    super.key,
    required this.quantity,
    required this.price,
    required this.onQuantityChange,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          QuantityButton(
            icon: Icons.remove,
            onPressed: () => onQuantityChange(-1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              quantity.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          QuantityButton(icon: Icons.add, onPressed: () => onQuantityChange(1)),
          const Spacer(),
          Text(
            '\$$price',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
