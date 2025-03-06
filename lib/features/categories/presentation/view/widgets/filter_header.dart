import 'package:bookly_app/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key, this.onTapReset});
  final void Function()? onTapReset;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        Text(
          'Filter',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),

        GestureDetector(
          onTap: onTapReset,
          child: Text('Reset', style: TextStyle(color: kSecondaryColor)),
        ),
      ],
    );
  }
}
