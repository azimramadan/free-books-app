import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_item_details.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_item_image.dart';
import 'package:flutter/cupertino.dart';

class BestDealsItemContent extends StatelessWidget {
  const BestDealsItemContent({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        BestDealsItemImage(imageUrl: book.image),
        SizedBox(width: screenWidth * 0.03),
        Expanded(child: BestDealsItemDetails(book: book)),
      ],
    );
  }
}
