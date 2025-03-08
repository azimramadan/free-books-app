import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

Widget buildInfoTile(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xffDEDEDE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$title: ',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: kSecondaryColor,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
