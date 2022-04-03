import 'package:flutter/material.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/vos/event_vo.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key, required this.event,required this.isPassed}) : super(key: key);
  final EventVO event;
  final bool isPassed;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: isPassed ? 0.3 :1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: screenWidth *0.7,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.style,
                size: 30,
                color: blueLightColor,
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmallText(
                    text: event.name ?? "",
                    textColors: Colors.black54,
                    textSize: 16,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_sharp,
                        size: 20,
                      ),
                      SmallText(
                        text: "${event.startTime ?? ""}AM - ${event.startTime ?? ""}PM",
                        textColors: Colors.black54,
                        textSize: 14,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
