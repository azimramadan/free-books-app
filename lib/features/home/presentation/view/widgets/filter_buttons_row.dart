import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterButtonsRow extends StatefulWidget {
  const FilterButtonsRow({super.key});

  @override
  State<FilterButtonsRow> createState() => _FilterButtonsRowState();
}

class _FilterButtonsRowState extends State<FilterButtonsRow> {
  String selectedFilter = "This Week";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:
          ["This Week", "This Month", "This Year"]
              .map(
                (filter) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(screenWidth / 4.2, 35),
                      maximumSize: Size(screenWidth / 4.2, 35),
                      backgroundColor:
                          selectedFilter == filter
                              ? Colors.black
                              : Colors.white,
                      foregroundColor:
                          selectedFilter == filter
                              ? Colors.white
                              : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        fontSize: screenWidth / 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
