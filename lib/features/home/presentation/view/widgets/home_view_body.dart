import 'package:bookly_app/core/assets.dart';
import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_deals_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/latest_books_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/top_books_section.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/upcoming_books_section.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Best Deals',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const BestDealsSection(),
          const SizedBox(height: 8),
          const TopBooksSection(),
          const SizedBox(height: 16),
          const LatestBooksSection(),
          const SizedBox(height: 16),
          const UpcomingBooksSection(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// 🔥 **تصميم بطاقة الكتاب**

final List<Book> books = [
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
    quantity: '1',
  ),
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
    quantity: '1',
  ),
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
    quantity: '1',
  ),
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    quantity: '1',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
  ),
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    quantity: '1',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
  ),
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    quantity: '1',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
  ),
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    quantity: '1',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
  ),
  Book(
    id: '1',
    image: Assets.testImage,
    title: 'Tuesday Mooney Talks to Ghosts',
    author: 'Kate Racculia',
    price: '33.00',
    discount: '12',
    genre: 'Mystery Novel',
    quantity: '1',
    description:
        'abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication abdelazim ramadan is th best developer for flutter aplication ',
    category: 'Classic',
    rating: '4.11/5',
  ),
];
