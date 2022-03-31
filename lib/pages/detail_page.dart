import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_circle_avatar_view.dart';
import '../widgets/medium_text.dart';

class DetailPage extends StatelessWidget{
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(),
     body: SizedBox(
       height: 200,
       child: ListView.builder(
         itemCount: 8,
         scrollDirection: Axis.horizontal,
         itemBuilder: (context, index) => Padding(
           padding: const EdgeInsets.all(16),
           child: Container(
             color: Colors.green,
             child: const MediumText(text: "HelloText"),),
         ),
       ),
     ),
   );
  }
}