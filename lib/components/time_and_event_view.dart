import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_app/components/smart_list_view.dart';
import 'package:flutter_dental_app/resources/dimens.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';
import 'package:intl/intl.dart';

import '../view_item/event_view.dart';
import '../vos/dummy_data.dart';
import '../vos/event_vo.dart';
import '../vos/time_vo.dart';

class TimeAndEventView extends StatefulWidget {
  const TimeAndEventView({
    Key? key,
  }) : super(key: key);
  //final Function onListEndReached;

  @override
  State<TimeAndEventView> createState() => _TimeAndEventViewState();
}

class _TimeAndEventViewState extends State<TimeAndEventView> {
  final List<TimeVO> times = timeList;

  final List<EventVO> events = eventList;
  final _scrollController = ScrollController();

  var currentDate =
      DateFormat("yyyy-MM-dd h:mm").format(DateTime.now().toLocal());

  var curDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  Future<void> _pullRefresh() async {
    debugPrint("PullToRefresh");
    setState(() {
      var snackBar = const SnackBar(
        content: Text("No More Data"),
        duration: Duration(seconds: 2),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          debugPrint("start position");
        } else {
          debugPrint("end position");
          // widget.onListEndReached();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: ListView.builder(
        // controller: _scrollController,
        itemCount: events.length,
        itemBuilder: (builder, index) {
          return TimeAndEventSection(
            timeVO: times[index],
            eventVO: events[index],
            index: index,
          );
        },
        padding: const EdgeInsets.only(top: 30, left: margin1XMedium),
      ),
    );
  }
}

class TimeAndEventSection extends StatelessWidget {
  const TimeAndEventSection(
      {Key? key,
      required this.timeVO,
      required this.eventVO,
      required this.index})
      : super(key: key);
  final TimeVO timeVO;
  final EventVO eventVO;
  final int index;

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

    /* debugPrint("current Time $dt1");
    debugPrint("pass current time: $dt2, $after");*/
    return after;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(
              text: timeVO.time ?? "",
              textColors: Colors.black54,
              textSize: 13,
            ),
            const SizedBox(
              width: 5,
            ),
            Row(children: [
              Visibility(
                /* visible: events[index].startTime == times[index].time &&
                              events[index].endTime == times[index + 1].time,*/
                visible: true,
                child: Column(
                  children: [
                    Visibility(
                      visible: _getCurrentTime(timeVO.time ?? "") == true,
                      child: Container(
                        width: 2,
                        height: 120,
                        color: Colors.black54,
                      ),
                    ),
                    Visibility(
                      visible: _getCurrentTime(timeVO.time ?? "") == false,
                      child: Column(
                        children: [
                          const DottedLine(
                            direction: Axis.vertical,
                            lineLength: 120,
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
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              EventView(
                event: eventVO,
                isPassed: index == 0 ? true : false,
              )
            ],)
          ],
        ),
      ],
    );
  }
}
