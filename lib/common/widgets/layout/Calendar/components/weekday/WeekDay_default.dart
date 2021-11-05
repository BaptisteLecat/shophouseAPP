import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/services/Utils/FamilyCalendar/Day.dart';

class WeekDayDefault extends StatelessWidget {
  final Day day;
  final bool isGivedMonth;
  const WeekDayDefault(
      {Key? key, required this.day, required this.isGivedMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.day.getDayNumber().toString(),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: this.isGivedMonth ? secondaryColorLessOpacity : bodyTextColor2,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }
}
