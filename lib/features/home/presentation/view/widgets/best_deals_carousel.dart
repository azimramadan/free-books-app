import 'package:bookly_app/features/home/presentation/view_model/best_deals_books_cubit/best_deals_books_cubit.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestDealsCarousel extends StatelessWidget {
  const BestDealsCarousel({
    super.key,
    required this.carouselController,
    this.onPageChanged,
    required this.books,
  });
  final List<Book> books;
  final CarouselSliderController carouselController;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: screenHeight * 0.19,
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
