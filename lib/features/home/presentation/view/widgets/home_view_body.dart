import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/home/presentation/view_model/best_deals_books_cubit/best_deals_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/top_books_cubit/top_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/free_books_cubit/free_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/latest_books_cubit/latest_books_cubit.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/latest_books_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/top_books_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/free_books_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FreeBooksCubit>(context).fetchFreeBooks();
    BlocProvider.of<LatestBooksCubit>(context).fetchLatestBooks();

    BlocProvider.of<TopBooksCubit>(context).fetchTopBooks();
    BlocProvider.of<BestDealsBooksCubit>(context).fetchBestDealsBooks();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Best Deals',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const BestDealsSection(),
          const SizedBox(height: 8),
          const TopBooksSection(),
          const SizedBox(height: 16),
          const LatestBooksSection(),
          const SizedBox(height: 16),
          const FreeBooksSection(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// 🔥 **تصميم بطاقة الكتاب**

final List<Book> books = [
  Book(
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
  ),
];
