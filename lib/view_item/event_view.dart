import 'package:flutter/material.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/vos/event_vo.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key, required this.event}) : super(key: key);
  final EventVO event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 200,
        height: 100,
        child: Row(
          children: [
            const Icon(
              Icons.style,
              size: 50,
              color: blueLightColor,
            ),
            Column(
              children: [
                SmallText(
                  text: event.name ?? "",
                  textColors: Colors.black54,
                  textSize: 16,
                ),
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
    );
  }
}
