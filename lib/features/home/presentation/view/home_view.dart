import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Happy Reading!',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.02),
            child: IconButton(
              iconSize: screenWidth * 0.08,
              color: kPrimaryColor,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
