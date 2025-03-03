import 'package:bookly_app/features/home/presentation/view/widgets/filter_buttons_row.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/horizontal_book_list.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/section_title.dart';
import 'package:flutter/cupertino.dart';

class TopBooksSection extends StatelessWidget {
  const TopBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: screenWidth * 0.09),
          child: SectionTitle(title: 'Top Books'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 6),
          child: FilterButtonsRow(),
        ),
        SizedBox(height: 6),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: HorizontalBookList(),
        ),
      ],
    );
  }
}
