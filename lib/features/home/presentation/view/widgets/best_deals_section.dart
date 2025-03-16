import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_carousel.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_model/best_deals_books_cubit/best_deals_books_cubit.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        bool isLoading = state is BestDealsBooksLoading;
        bool isError = state is BestDealsBooksFailure;

        return Skeletonizer(
          enabled: isLoading, // تفعيل الـ Skeleton أثناء التحميل فقط
          child: Column(
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
                        : List.generate(
                          7,
                          (_) => dummyBook,
                        ), // بيانات فارغة أثناء التحميل
              ),
              const SizedBox(height: 8),
              if (!isError)
                BestDealsIndicator(
                  currentIndex: currentIndex,
                  count: 7,
                  controller: controller,
                )
              else
                Center(
                  child: Text(
                    (state).errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

final dummyBook = Book(
  webReaderLink:
      "http://play.google.com/books/reader?id=afMOAAAAQAAJ&hl=&as_brr=7&as_pt=BOOKS&source=gbs_api",

  id: '1',
  image:
      'https://books.google.com/books/content?id=afMOAAAAQAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
  title: 'Tuesday Mooney Talks to Ghosts',
  authors: ['Kate Racculia'],
  price: 0,
  discount: 12,
  genres: ['Mystery Novel'],
  description:
      'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
  category: 'Classic',
  rating: 4.11,
  downloadLinkPdf:
      'http://books.google.com.eg/books/download/The_general_s_letters_1885.pdf?id=afMOAAAAQAAJ&hl=&output=pdf&sig=ACfU3U3gJfP2uv3kWtLcZyzQJHJR2uR25w&source=gbs_api',
);
