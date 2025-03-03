import 'package:bookly_app/features/home/presentation/view/widgets/book_card.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/cupertino.dart';

class HorizontalBookList extends StatelessWidget {
  const HorizontalBookList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: BookCard(book: books[0]),
        );
      },
    );
  }
}
