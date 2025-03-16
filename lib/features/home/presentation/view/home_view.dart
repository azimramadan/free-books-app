import 'package:bookly_app/features/home/data/repositories/best_deals_books_repository.dart';
import 'package:bookly_app/features/home/data/repositories/free_books_repository.dart';
import 'package:bookly_app/features/home/data/repositories/latest_books_repository.dart';
import 'package:bookly_app/features/home/data/repositories/top_books_repository.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:bookly_app/features/home/presentation/view_model/best_deals_books_cubit/best_deals_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/top_books_cubit/top_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/free_books_cubit/free_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/latest_books_cubit/latest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FreeBooksCubit(FreeBooksRepository()),
        ),
        BlocProvider(
          create: (context) => LatestBooksCubit(LatestBooksRepository()),
        ),
        BlocProvider(create: (context) => TopBooksCubit(TopBooksRepository())),
        BlocProvider(
          create: (context) => BestDealsBooksCubit(BestDealsBooksRepository()),
        ),
      ],
      child: Scaffold(appBar: HomeViewAppBar(), body: HomeViewBody()),
    );
  }
}
