import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';
import 'package:intl/intl.dart';

import '../view_item/event_view.dart';
import '../vos/dummy_data.dart';
import '../vos/event_vo.dart';
import '../vos/time_vo.dart';

class TimeAndEventView extends StatelessWidget {
  TimeAndEventView({Key? key}) : super(key: key);
  final List<TimeVO> times = timeList;
  final List<EventVO> events = eventList;

  var currentDate =
      DateFormat("yyyy-MM-dd h:mm").format(DateTime.now().toLocal());

  var curDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String _dateToString(DateTime date) {
    return DateFormat("yyyy-MM-dd hh:mm:ss").format(date);
  }

  bool _getCurrentTime(String time) {
    var curTimeDate = DateTime.now().toLocal();
    var timeDate = DateFormat("h:mm").parse(time).toLocal();
    var now = DateTime.now();
    timeDate =
        DateTime(now.year, now.month, now.day, timeDate.hour, timeDate.minute);

    DateTime dt1 = DateTime.parse(_dateToString(curTimeDate));
    DateTime dt2 = DateTime.parse(_dateToString(timeDate));
    var after = dt1.isBefore(dt2);
    //print("DT1 is before DT2: $after");

    debugPrint("current Time $dt1");
    debugPrint("pass current time: $dt2, $after");
    return after;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        width: 300,
        child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (builder, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: times[index].time ?? "",
                        textColors: Colors.black54,
                        textSize: 13,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Visibility(
                        /* visible: events[index].startTime == times[index].time &&
                            events[index].endTime == times[index + 1].time,*/
                        visible: true,
                        child: Column(
                          children: [
                            Visibility(
                              visible:
                                  _getCurrentTime(times[index].time ?? "") ==
                                      true,
                              child: Container(
                                width: 2,
                                height: 130,
                                color: Colors.black54,
                              ),
                            ),
                            Visibility(
                                visible:
                                    _getCurrentTime(times[index].time ?? "") ==
                                        false,
                                child: Column(
                                  children: [
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      lineLength: 130,
                                      dashLength: 3,
                                      lineThickness: 2,
                                      dashColor: Colors.black,
                                    ),
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius: BorderRadius.circular(10)),
                                    ),
                                  ],
                                ),
                            ),
                          /*  Visibility(
                              visible: _getCurrentTime(times[index].time ?? ""),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )*/
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      EventView(
                        event: events[index],
                        isPassed: false,
                      )
                    ],
                  ),
                  /* SmallText(text: times[index].time ?? "",
                  textColors: Colors.black54,
                  textSize: 13,
                ),
                const SizedBox(height: 10,)*/
                ],
              );
            }));
  }
}
