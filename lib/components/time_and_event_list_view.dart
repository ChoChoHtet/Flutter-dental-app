import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dental_app/components/smart_list_view.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/widgets/medium_text.dart';

import '../view_item/event_view.dart';
import '../vos/dummy_data.dart';
import '../vos/event_vo.dart';
import '../vos/time_vo.dart';
import '../widgets/small_text.dart';

class TimeAndEventListView extends StatefulWidget {
  const TimeAndEventListView({Key? key}) : super(key: key);

  @override
  State<TimeAndEventListView> createState() => _TimeAndEventListViewState();
}

class _TimeAndEventListViewState extends State<TimeAndEventListView> {
  final List<TimeVO> times = timeList;
  final List<EventVO> events = eventList;

  Future<void> _pullRefresh() async {
    debugPrint("PullToRefresh");
    setState(() {
      _showSnackBar("No More Data");
    });
  }

  void _showSnackBar(String message) {
    var snackBar =  SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var timeWidth = screenWidth * 0.14;
    var eventWidth = screenWidth - timeWidth - 16;
    var eventHeight = screenWidth * 0.7;
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: SmartListView(
        onListEndReached: () {
          debugPrint("Hello");
          _showSnackBar("Next Page");
        },
        itemCount: 1,
        itemBuilder: (context, index) => Row(
          children: [
            SizedBox(
              width: timeWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MediumText(
                    text: "Time",
                    textColors: Colors.black,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: times.length,
                      separatorBuilder: (builder, index) => const SizedBox(
                            height: 50,
                          ),
                      itemBuilder: (context, index) {
                        return SmallText(
                          text: times[index].time ?? "",
                          textColors: Colors.black54,
                          textSize: 13,
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              width: eventWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: MediumText(
                      text: "Events",
                      textColors: Colors.black,
                    ),
                  ),
                  (events.isNotEmpty)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: events.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: (index > 0)
                                  ? disableEventColor
                                  : timeAndEventColor,
                              child: Row(
                                children: [
                                  ItemDividerView(
                                    index: index,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  EventView(
                                    event: events[index],
                                    isPassed: index == 0 ? true : false,
                                  ),
                                ],
                              ),
                            );
                          })
                      : const Center(
                          child: MediumText(text: "No Event "),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDividerView extends StatelessWidget {
  const ItemDividerView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: index > 0,
          child: Container(
            width: 2,
            height: 120,
            color: Colors.black54,
          ),
        ),
        Visibility(
          visible: index == 0,
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
    );
  }
}
