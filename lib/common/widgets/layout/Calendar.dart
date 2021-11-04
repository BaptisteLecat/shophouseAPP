import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/constant/data.dart';
import 'package:shophouse/services/Utils/FamilyCalendar/Calendar.dart';
import 'package:shophouse/services/Utils/FamilyCalendar/Day.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  /*Map<int, List<String>> dayWeekNumbersForMonth = {
    0: ["27", "4", "11", "18", "25"],
    1: ["28", "5", "12", "19", "26"],
    2: ["29", "6", "13", "20", "27"],
    3: ["30", "7", "14", "21", "28"],
    4: ["1", "8", "15", "22", "29"],
    5: ["2", "9", "16", "23", "30"],
    6: ["3", "10", "17", "24", "31"],
  };*/
  Map<int, List<Day>> dayWeekNumbersForMonth = Calendar().generateCalendar();

  Text _weekHeader(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6!.copyWith(
          color: primaryColor, fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  Text _weekDay(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: bodyTextColor2, fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  List<Widget> _dayWeekNumbersForMonthList(
      Map<int, List<Day>> dayWeekNumbersForMonth) {
    List<Text> dayNumbersWidget;
    List<Widget> weekDayWidget = [];

    dayWeekNumbersForMonth.forEach((weekdayIndex, dayNumberList) {
      //Reset list of dayNumbers.
      dayNumbersWidget = [];
      //First adding the header day title.
      dayNumbersWidget.add(_weekHeader(const_weekDayLabel[weekdayIndex - 1]));
      //Loop on the daysNumber of this weekDay for this month.
      dayNumberList.asMap().forEach((index, day) {
        dayNumbersWidget.add(_weekDay(day.getDayNumber().toString()));
      });
      //Adding this weekDay column of dayNumbers to the list of weekDayWidget will be returned.
      weekDayWidget.add(Expanded(
          child: Column(
              children: dayNumbersWidget,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly)));
    });

    return weekDayWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Octobre 2021",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Container(height: 10, width: 10, color: primaryColor),
                      SizedBox(
                        width: 10,
                      ),
                      Container(height: 10, width: 10, color: primaryColor)
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _dayWeekNumbersForMonthList(dayWeekNumbersForMonth),
              ),
            )
          ],
        ));
  }
}
