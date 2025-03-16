import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/filter_buttons_row.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/horizontal_book_list.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/section_title.dart';
import 'package:bookly_app/features/home/presentation/view_model/top_books_cubit/top_books_cubit.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopBooksSection extends StatefulWidget {
  const TopBooksSection({super.key});

  @override
  State<TopBooksSection> createState() => _TopBooksSectionState();
}

class _TopBooksSectionState extends State<TopBooksSection> {
  String selectedFilter = "This Week";
  List<Book> books = [];

  // كتب وهمية أثناء التحميل
  final List<Book> dummyBooks = List.generate(5, (index) => dummyBook);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TopBooksCubit, TopBooksState>(
      builder: (context, state) {
        bool isLoading = state is TopBooksLoading;
        bool isError = state is TopBooksFailure;

        List<Book> filteredBooks = [];
        if (state is TopBooksSuccess) {
          if (selectedFilter == "This Week") {
            filteredBooks = state.books.sublist(0, 10);
          } else if (selectedFilter == "This Month") {
            filteredBooks = state.books.sublist(10, 21);
          } else {
            filteredBooks = state.books.sublist(21, 31);
          }
        }

        return Skeletonizer(
          enabled: isLoading, // تفعيل تأثير التحميل
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: screenWidth * 0.09),
                child: SectionTitle(
                  title: 'Top Books',
                  onTap: () {
                    context.push(
                      AppRouter.kBooksGridView,
                      extra: [
                        state is TopBooksSuccess ? state.books : [],
                        'Top Books',
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 6),
                child: FilterButtonsRow(
                  onFilterSelected: (filter) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                ),
              ),
              const SizedBox(height: 6),
              if (!isError)
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: HorizontalBookList(
                    books: isLoading ? dummyBooks : filteredBooks,
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
