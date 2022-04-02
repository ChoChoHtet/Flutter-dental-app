import 'package:flutter/material.dart';

import '../view_item/office_view.dart';
import '../vos/office_vo.dart';

class AppointmentSectionView extends StatelessWidget {
  const AppointmentSectionView({
    Key? key,
    required this.offices,
    required this.isHomePage,
    required this.onTapCard
  }) : super(key: key);

  final List<OfficeVO> offices;
  final VoidCallback onTapCard;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 20),
      width: 600,
      height: isHomePage ? 140 : 240,
      child: ListView.builder(
        itemCount: offices.length,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: onTapCard,
              child: OfficeView(
                office: offices[index],
                isHomePage: isHomePage,
              ),
            )),
      ),
    );
  }
}