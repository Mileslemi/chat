// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> selectors = ['Messages', 'Online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      //color: Colors.blue,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectors.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20.0,
              ),
              child: Text(
                selectors[index],
                style: TextStyle(
                    color:
                        selectedIndex == index ? Colors.white : Colors.white70,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
            ),
          );
        },
      ),
    );
  }
}
