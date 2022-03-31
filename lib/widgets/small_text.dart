import 'package:flutter/material.dart';

class SmallText extends StatelessWidget{
  final String text;
  final Color textColors;
  final double textSize;

  const SmallText({Key? key,
    required this.text,
    this.textColors = Colors.white54,
    this.textSize = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColors,
          fontWeight: FontWeight.w600,
          fontSize: textSize
      ),
    );
  }
}