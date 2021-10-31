// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Function onPress;
  final Color colour;
  final Widget cardChild;

  // ignore: use_key_in_widget_constructors
  ReusableCard(
    this.colour,
    this.cardChild,
    this.onPress,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress;
      },
      child: Container(
        child: cardChild,
        // padding: const EdgeInsets.only(top: 8.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
