

import 'package:flutter/material.dart';

class MediumText extends StatelessWidget{
  final String? text;
  final Color textColors;

  const MediumText({Key? key,
    required this.text,
    this.textColors = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Text(
     text ?? "",
     style: TextStyle(
       color: textColors,
       fontWeight: FontWeight.w600,
       fontSize: 18
     ),
   );
  }
}