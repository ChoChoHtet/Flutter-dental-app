import 'package:flutter/material.dart';
import 'package:flutter_dental_app/components/time_and_event_list_view.dart';
import 'package:flutter_dental_app/components/time_and_event_view.dart';
import 'package:flutter_dental_app/pages/detail_page.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/resources/dimens.dart';
import 'package:flutter_dental_app/view_item/event_view.dart';
import 'package:flutter_dental_app/view_item/office_view.dart';
import 'package:flutter_dental_app/vos/dummy_data.dart';
import 'package:flutter_dental_app/vos/event_vo.dart';
import 'package:flutter_dental_app/vos/office_vo.dart';
import 'package:flutter_dental_app/vos/time_vo.dart';
import 'package:flutter_dental_app/widgets/custom_circle_avatar_view.dart';
import 'package:flutter_dental_app/widgets/medium_text.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';

import '../widgets/appointment_section_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<OfficeVO> offices = officeList;
  final List<TimeVO> times = timeList;
  final List<EventVO> events = eventList;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: timeAndEventColor,
        body: Stack(
      children: [
        Column(
          children: [
            const MyPatientSection(),
            Container(
              padding: const EdgeInsets.only(top: 70, left: 16),
              height: screenHeight *0.7,
              //child: TimeAndEventView(),
              child:  const TimeAndEventListView(),
            ),
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 5.2,
          child: AppointmentSectionView(
            offices: offices,
            isHomePage: true,
            onTapCard: () => _navigateDetailPage(context),
          ),
        )
      ],
    ));
  }

  void _navigateDetailPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage()));
  }
}

class MyPatientSection extends StatelessWidget {
  const MyPatientSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [blueLightColor, primaryColor]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: margin1XMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 60,
            ),
            SearchAndAvatarView(),
            SizedBox(
              height: 40,
            ),
            PatientAndTodayButtonView(),
          ],
        ),
      ),
    );
  }
}

class SearchAndAvatarView extends StatelessWidget {
  const SearchAndAvatarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: SearchBarView(),
          flex: 3,
        ),
        Expanded(
          child: CustomCircleAvatarView(),
          flex: 1,
        ),
      ],
    );
  }
}

class PatientAndTodayButtonView extends StatelessWidget {
  const PatientAndTodayButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MediumText(
              text: "My Patients",
            ),
            SmallText(
              text: "total",
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: todayButtonColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: const [
              SmallText(
                text: "Today",
                textSize: 13,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white54,
              )
            ],
          ),
        )
      ],
    );
  }
}

class SearchBarView extends StatelessWidget {
  const SearchBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: marginMedium),
      decoration: BoxDecoration(
        color: searchBarColor,
        borderRadius: BorderRadius.circular(30),
      ),
      height: searchBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.search,
            size: 20,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
