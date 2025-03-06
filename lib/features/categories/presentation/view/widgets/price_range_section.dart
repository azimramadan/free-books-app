import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/categories/presentation/view/widgets/custom_slider.dart';
import 'package:flutter/cupertino.dart';

class PriceRangeSection extends StatelessWidget {
  const PriceRangeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Price Range',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            Spacer(),
            Text(
              '0-200\$',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomSlider(),
        ),
      ],
    );
  }
}
