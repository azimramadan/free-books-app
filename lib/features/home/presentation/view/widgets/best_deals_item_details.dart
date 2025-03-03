import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_discount_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestDealsItemDetails extends StatelessWidget {
  const BestDealsItemDetails({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          book.genre,
          style: TextStyle(
            color: Color(0xffDEDEDE),
            fontSize: screenWidth * 0.03,
          ),
        ),
        Text(
          book.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          book.author,
          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.03),
        ),
        Row(
          children: [
            Text(
              r'$' + book.price,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: SizedBox()),
            BookDiscountBadge(discount: book.discount),
          ],
        ),
      ],
    );
  }
}
