import 'package:flutter/material.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/resources/dimens.dart';
import 'package:flutter_dental_app/widgets/custom_circle_avatar_view.dart';
import 'package:flutter_dental_app/widgets/medium_text.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';

import '../vos/office_vo.dart';

class OfficeView extends StatelessWidget {
  const OfficeView({Key? key, required this.office}) : super(key: key);
  final OfficeVO office;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        color: blueLightColor,
        child: Row(
          children: [
            Container(
              color: todayButtonColor,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SmallText(
                    text: "Office No.248/3 patients",
                    textSize: 14,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.timer,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      SmallText(
                        text: "8:30 AM-02:00PM",
                        textSize: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Row(
                            children: office.profileUrl.map((url) {
                              return SizedBox(
                                  height: 30,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(url),
                                  ));
                            }).toList()),
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
