import 'package:bookly_app/features/home/data/repositories/free_books_repository.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:bookly_app/features/home/presentation/view_model/cubit/free_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreeBooksCubit(FreeBooksRepository()),
      child: Scaffold(appBar: HomeViewAppBar(), body: HomeViewBody()),
    );
  }
}
