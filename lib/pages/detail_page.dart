import 'package:flutter/material.dart';
import 'package:flutter_dental_app/components/custom_circle_paint.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/widgets/appointment_section_view.dart';

import '../vos/dummy_data.dart';
import '../vos/event_vo.dart';
import '../vos/office_vo.dart';
import '../vos/time_vo.dart';
import '../widgets/medium_text.dart';
import '../widgets/small_text.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);
  final List<OfficeVO> offices = officeList;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var topHeight = screenHeight * 0.35;
    var centerHeight = screenHeight * 0.45;
    var bottomHeight = screenHeight * 0.05;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: detailTopColor,
          elevation: 0,
          title: const Center(child: Text("Today")),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            ),
          ),
          actions: const [
            Icon(
              Icons.search,
              size: 24,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.menu_outlined,
                size: 24,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: detailTopColor,
                    height: topHeight,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        MediumText(
                          text: "Office No. 248",
                        ),
                        SmallText(
                          text: "3 patient",
                          textSize: 16,
                        )
                      ],
                    )),
                Container(
                  color: detailBottomColor,
                  height: centerHeight,
                ),
                Container(
                  color: Colors.white,
                  height: bottomHeight,
                )
              ],
            ),
            Positioned(
              top: topHeight * 0.5,
              left: 60,
              child: const CustomCirclePaint(),
            ),
            Positioned(
              top: screenHeight *0.2,
              left: screenWidth *0.69,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
              ),
            ),
            Positioned(
              top: screenHeight *0.4,
              left: screenWidth *0.13,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)
                ),
              ),
            ),
            Positioned(
              top: screenHeight *0.47,
              left: screenWidth *0.44,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
              ),
            ),
            Positioned(
              top: screenHeight *0.55,
              left: 1,
              right: 1,
              child: AppointmentSectionView(
                offices: offices,
                isHomePage: false,
                onTapCard: () => debugPrint("OnClick"),
              ),
            )
          ],
        ));
  }
}
