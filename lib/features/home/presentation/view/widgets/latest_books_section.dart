import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/horizontal_book_list.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/section_title.dart';
import 'package:bookly_app/features/home/presentation/view_model/latest_books_cubit/latest_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LatestBooksSection extends StatelessWidget {
  const LatestBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<LatestBooksCubit, LatestBooksState>(
      builder: (context, state) {
        if (state is LatestBooksLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LatestBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: screenWidth * 0.09),
                child: SectionTitle(
                  title: 'Latest Books',
                  onTap: () {
                    context.push(
                      AppRouter.kBooksGridView,
                      extra: [
                        state is LatestBooksSuccess ? state.books : [],
                        'Latest Books',
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: HorizontalBookList(
                  books: state is LatestBooksSuccess ? state.books : [],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
