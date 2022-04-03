import 'package:flutter/material.dart';
import 'package:flutter_dental_app/resources/colors.dart';
import 'package:flutter_dental_app/resources/dimens.dart';
import 'package:flutter_dental_app/widgets/custom_circle_avatar_view.dart';
import 'package:flutter_dental_app/widgets/medium_text.dart';
import 'package:flutter_dental_app/widgets/small_text.dart';

import '../vos/office_vo.dart';

class OfficeView extends StatelessWidget {
  const OfficeView({Key? key, required this.office, this.isHomePage = true})
      : super(key: key);
  final OfficeVO office;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: isHomePage ? 300 : 350,
        child: Card(
          color: isHomePage ? blueLightColor : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(10)),
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isHomePage,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      decoration: BoxDecoration(
                          color: todayButtonColor,
                          borderRadius: BorderRadius.circular(10)),
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
                            const TimeView(),
                            const SizedBox(height: 10),
                            PatientProfileView(office: office)
                          ],
                        )),
                  ],
                ),
              ),
              Visibility(
                visible: !isHomePage,
                child: Padding(
                  padding: const EdgeInsets.all(marginMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TimeView(
                            timeColor: Colors.black38,
                          ),
                         Container(
                           padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(4),
                             border: Border.all(color: Colors.black12,width: 1)
                           ),
                            child:const SmallText(text: "Confirmed",
                            textSize: smallTextSize,
                            textColors: Colors.greenAccent,),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: marginSmall,
                      ),
                      const MediumText(
                        text: "Tee Drilling",
                        textColors: Colors.black,
                      ),
                      const SizedBox(
                        height: marginMedium,
                      ),
                      const SmallText(
                        text:
                            "Whatever I said, whatever I did I didn't mean it I just want you back for good)",
                        textSize: smallTextSize,
                        textColors: Colors.black45,
                      ),
                      const SizedBox(
                        height: marginMedium,
                      ),
                      Row(
                        children: const [
                          CustomCircleAvatarView(),
                          SizedBox(
                            width: marginMedium,
                          ),
                          SmallText(
                            text: "Aye John",
                            textColors: Colors.black38,
                            textSize: smallTextSize,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PatientProfileView extends StatelessWidget {
  const PatientProfileView({
    Key? key,
    required this.office,
  }) : super(key: key);

  final OfficeVO office;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class TimeView extends StatelessWidget {
  const TimeView({Key? key, this.timeColor = Colors.white}) : super(key: key);
  final Color timeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       /* const SizedBox(
          width: 5,
        ),*/
        Icon(
          Icons.timer,
          color: timeColor,
        ),
        const SizedBox(width: 10),
        SmallText(
          text: "8:30 AM-02:00PM",
          textSize: 12,
          textColors: timeColor,
        ),
      ],
    );
  }
}
