import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_carousel.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_indicator.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:bookly_app/features/home/presentation/view_model/best_deals_books_cubit/best_deals_books_cubit.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<BestDealsBooksCubit, BestDealsBooksState>(
      builder: (context, state) {
        if (state is BestDealsBooksLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BestDealsBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Column(
            children: [
              BestDealsCarousel(
                carouselController: controller,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                books:
                    state is BestDealsBooksSuccess
                        ? state.books.sublist(0, 7)
                        : [],
              ),
              SizedBox(height: 8),
              BestDealsIndicator(
                currentIndex: currentIndex,
                count: 7,
                controller: controller,
              ),
            ],
          );
        }
      },
    );
  }
}
