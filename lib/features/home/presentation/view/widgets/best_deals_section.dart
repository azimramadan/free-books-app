import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_carousel.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_indicator.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

class BestDealsSection extends StatefulWidget {
  const BestDealsSection({super.key});

  @override
  State<BestDealsSection> createState() => _BestDealsSectionState();
}

class _BestDealsSectionState extends State<BestDealsSection> {
  final CarouselSliderController controller = CarouselSliderController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BestDealsCarousel(
          carouselController: controller,
          books: books,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        SizedBox(height: 8),
        BestDealsIndicator(
          currentIndex: currentIndex,
          count: books.length,
          controller: controller,
        ),
      ],
    );
  }
}
