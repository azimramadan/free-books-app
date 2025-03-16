import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/horizontal_book_list.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/section_title.dart';
import 'package:bookly_app/features/home/presentation/view_model/free_books_cubit/free_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FreeBooksSection extends StatelessWidget {
  const FreeBooksSection({super.key});

  // كتب وهمية أثناء التحميل
  static final List<Book> dummyBooks = List.generate(5, (index) => dummyBook);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<FreeBooksCubit, FreeBooksState>(
      builder: (context, state) {
        bool isLoading = state is FreeBooksLoading;
        bool isError = state is FreeBooksFailure;

        return Skeletonizer(
          enabled: isLoading, // تفعيل تأثير التحميل
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: screenWidth * 0.09),
                child: SectionTitle(
                  title: 'Free Books',
                  onTap: () {
                    context.push(
                      AppRouter.kBooksGridView,
                      extra: [
                        state is FreeBooksSuccess ? state.books : [],
                        'Free Books',
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              if (!isError)
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: HorizontalBookList(
                    books:
                        isLoading
                            ? dummyBooks // عرض الكتب الوهمية أثناء التحميل
                            : (state is FreeBooksSuccess ? state.books : []),
                  ),
                )
              else
                Center(
                  child: Text(
                    (state).errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
