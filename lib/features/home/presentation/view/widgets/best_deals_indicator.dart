import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BestDealsIndicator extends StatelessWidget {
  const BestDealsIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
    required this.controller,
  });

  final int currentIndex;
  final int count;
  final CarouselSliderController controller;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: currentIndex,
        count: count,
        effect: WormEffect(
          dotWidth: screenWidth * 0.02,
          dotHeight: screenWidth * 0.02,
          dotColor: Color(0xffB8B8B8),
          activeDotColor: Color(0xff35247B),
        ),
        onDotClicked: (index) {
          controller.animateToPage(index);
        },
      ),
    );
  }
}
