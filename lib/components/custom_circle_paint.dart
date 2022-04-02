

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/widgets/medium_text.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';

class CustomCirclePaint extends StatelessWidget{
  const CustomCirclePaint({Key? key}) : super(key: key);


@override
  Widget build(BuildContext context) {
   return CustomPaint(
     size: const Size(300,300),
     painter: CirclePaint(),
     child:SizedBox(
       height: 300,
       width: 300,
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: const [
             SmallText(text: "2:45",textSize: 30,textColors: Colors.white,),
             SmallText(text: "PM",textSize: 18,)
           ],
         ),
       ),
     ),

   );
  }
}
class CirclePaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var outerPaint = Paint();
    outerPaint.strokeWidth = 20.0;
    outerPaint.color = todayButtonColor;
    outerPaint.style = PaintingStyle.stroke ;

    var innerPaint = Paint();
    innerPaint.color = detailBottomColor;
    innerPaint.style = PaintingStyle.fill ;

    var midPaint = Paint();
    midPaint.color = midCircleColor;
    midPaint.style = PaintingStyle.fill;


    var dottedPaint = Paint();
    dottedPaint.strokeWidth = 1.0;
    dottedPaint.color = Colors.white;

    var linePaint = Paint();
    linePaint.strokeWidth = 4.0;
    linePaint.color = Colors.white;

    var radius = size.width/2;

    canvas.drawCircle(
        Offset(size.width/2,size.height/2), radius, outerPaint);

    canvas.drawCircle(
        Offset(size.width/2,size.height/2), radius *0.95,midPaint);
    canvas.drawCircle(
        Offset(size.width/2,size.height/2), radius *0.5, innerPaint);

    canvas.drawLine(Offset(size.width*0.9,size.height*0.54),
        Offset(size.width*1.1 ,size.height*0.54), linePaint);

    final double centerX= size.width/2;
    final double centerY = size.height/2;
    const double filledCircleRadius = 2;
    double dotCircleRadius = radius *0.75;
    int noOfDots =30;
    double radiantStep = 2*pi /noOfDots;
    for(int i = 0;i<noOfDots;i++){
      canvas.drawCircle(
          Offset(centerX + sin(i*radiantStep)*dotCircleRadius,
              centerY + cos(i*radiantStep)*dotCircleRadius), filledCircleRadius, dottedPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false ;
  }

}