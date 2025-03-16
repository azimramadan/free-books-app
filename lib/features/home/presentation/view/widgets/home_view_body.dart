import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/home/presentation/view_model/best_deals_books_cubit/best_deals_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/top_books_cubit/top_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/free_books_cubit/free_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/latest_books_cubit/latest_books_cubit.dart';
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
