// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class SearchField extends StatelessWidget {
  final Function(String value) onChange;
  final String? hintText;
  const SearchField({Key? key, required this.onChange, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double finalFontSearch = (screenHeight).clamp(double.minPositive, 20.0);

    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.blueGrey[900],
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText ?? "Search",
                fillColor: Colors.white,
              ),
              onChanged: (value) => onChange(value),
            ),
          ),
          SizedBox(width: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Material(
              color: primaryColor,
              child: InkWell(
                onTap: () {
                  // TODO: Add action here
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    size: finalFontSearch,
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
