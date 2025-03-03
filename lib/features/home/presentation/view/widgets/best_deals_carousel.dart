import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_item.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class BestDealsCarousel extends StatelessWidget {
  const BestDealsCarousel({
    super.key,
    required this.carouselController,
    required this.books,
    this.onPageChanged,
  });

  final CarouselSliderController carouselController;
  final List<Book> books;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: screenHeight * 0.23,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enableInfiniteScroll: true,
        viewportFraction: .8,
        onPageChanged: onPageChanged,
      ),
      carouselController: carouselController,
      items:
          books.map((book) {
            return Builder(
              builder: (BuildContext context) {
                return BestDealsItem(book: book);
              },
            );
          }).toList(),
    );
  }
}
