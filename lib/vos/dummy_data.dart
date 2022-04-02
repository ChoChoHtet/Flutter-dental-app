import 'package:flutter_dental_app/vos/event_vo.dart';
import 'package:flutter_dental_app/vos/office_vo.dart';
import 'package:flutter_dental_app/vos/time_vo.dart';

var officeList = [
  OfficeVO(
      1,
      "Office No. 246",
      3,
      "08:00 AM - 02:00 PM",
      ["https://media.wired.com/photos/5d960eba01e4a4000826137c/master/pass/Culture_Monitor_WillSmith-465783654.jpg",
        "https://media.wired.com/photos/5d960eba01e4a4000826137c/master/pass/Culture_Monitor_WillSmith-465783654.jpg"]
  ),
  OfficeVO(
      2,
      "Office No. 246",
      6,
      "08:00 AM - 02:00 PM",
      ["https://media.wired.com/photos/5d960eba01e4a4000826137c/master/pass/Culture_Monitor_WillSmith-465783654.jpg",
        "https://media.wired.com/photos/5d960eba01e4a4000826137c/master/pass/Culture_Monitor_WillSmith-465783654.jpg"]
  ),
  OfficeVO(
      3,
      "Office No. 246",
      9,
      "08:00 AM - 02:00 PM",
      ["https://media.wired.com/photos/5d960eba01e4a4000826137c/master/pass/Culture_Monitor_WillSmith-465783654.jpg",
        "https://media.wired.com/photos/5d960eba01e4a4000826137c/master/pass/Culture_Monitor_WillSmith-465783654.jpg"]
  ),
];
var timeList = [
  TimeVO(1, "10:30"),
  TimeVO(2, "11:00"),
  TimeVO(3, "11:30"),
  TimeVO(4, "12:00"),
  TimeVO(5, "12:30"),
  TimeVO(6, "10:30"),
  TimeVO(7, "11:00"),
  TimeVO(8, "11:30")

];

var eventList = [
  EventVO(1, "Hello Testing 1", "8:00", "8:30"),
  EventVO(2, "Hello Testing 2", "9:00", "9:30"),
  EventVO(3, "Hello Testing 2", "10:00", "10:30"),
];