import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/shared/presentation/view/widgets/book_card.dart';
import 'package:flutter/cupertino.dart';

class HorizontalBookList extends StatelessWidget {
  const HorizontalBookList({super.key, required this.books});
  final List<Book> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: books.length > 10 ? 10 : books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              index == 0
                  ? EdgeInsets.only(left: 20, right: 14)
                  : EdgeInsets.only(right: 14),
          child: BookCard(book: books[index]),
        );
      },
    );
  }
}
