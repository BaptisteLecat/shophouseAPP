import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/services/Utils/FamilyCalendar/Day.dart';

class WeekDayCurrent extends StatelessWidget {
  final Day day;
  const WeekDayCurrent({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Text(
        this.day.getDayNumber().toString(),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
