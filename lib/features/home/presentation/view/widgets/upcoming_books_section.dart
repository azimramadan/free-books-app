import 'package:bookly_app/core/routes.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/horizontal_book_list.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class UpcomingBooksSection extends StatelessWidget {
  const UpcomingBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: screenWidth * 0.09),
          child: SectionTitle(
            title: 'Upcoming Books',
            onTap: () {
              context.push(
                AppRouter.kTopBooksView,
                extra: [books, 'Upcoming Books'],
              );
            },
          ),
        ),

        SizedBox(height: 8),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: HorizontalBookList(),
        ),
      ],
    );
  }
}
