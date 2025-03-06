import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double price = 100;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 5.0,
        trackShape: RectangularSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),

        overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
      ),
      child: Slider(
        activeColor: kPrimaryColor,
        inactiveColor: const Color(0xffB8B8B8),
        thumbColor: kPrimaryColor,
        value: price,
        label: '${price.toInt()} \$',
        min: 0,
        max: 200,
        divisions: 500,
        onChanged: (newPrice) {
          setState(() {
            price = newPrice;
          });
        },
      ),
    );
  }
}
