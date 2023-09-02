import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  MyTextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.textSize,
      this.isTitle = false,
      this.maxLines = 10});

  final String text;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontSize: textSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
    );
  }
}
