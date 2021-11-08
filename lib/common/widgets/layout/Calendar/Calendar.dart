import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/constant/data.dart';
import 'package:shophouse/common/widgets/layout/Calendar/components/weekday/WeekDay_default.dart';
import 'package:shophouse/common/widgets/layout/Calendar/components/weekday/weekDay_current.dart';
import 'package:shophouse/services/Utils/FamilyCalendar/Calendar.dart';
import 'package:shophouse/services/Utils/FamilyCalendar/Day.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  Calendar calendar = Calendar();
  Map<int, List<Day>> dayWeekNumbersForMonth = {};

  @override
  void initState() {
    super.initState();
    _generateCalendar();
  }

  void _generateCalendar() {
    this.dayWeekNumbersForMonth = calendar.generateCalendar();
  }

  Text _weekHeader(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6!.copyWith(
          color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _weekDay(Day day) {
    Widget returnedWidget;
    if (day.isCurrentDay()) {
      returnedWidget = WeekDayCurrent(day: day);
    } else {
      returnedWidget = WeekDayDefault(
          day: day, isGivedMonth: (day.isGivedMonth(this.calendar.getMonth())));
    }
    return returnedWidget;
  }

  String getMonth() {
    return const_monthLabel[calendar.getMonth() - 1];
  }

  Text _displayDate() {
    return Text(
      "${this.getMonth()} ${calendar.getYear()}",
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(fontWeight: FontWeight.w600),
    );
  }

  List<Widget> _dayWeekNumbersForMonthList(
      Map<int, List<Day>> dayWeekNumbersForMonth) {
    List<Widget> dayNumbersWidget;
    List<Widget> weekDayWidget = [];

    dayWeekNumbersForMonth.forEach((weekdayIndex, dayNumberList) {
      //Reset list of dayNumbers.
      dayNumbersWidget = [];
      //First adding the header day title.
      dayNumbersWidget.add(_weekHeader(const_weekDayLabel[weekdayIndex - 1]));
      //Loop on the daysNumber of this weekDay for this month.
      dayNumberList.asMap().forEach((index, day) {
        dayNumbersWidget.add(_weekDay(day));
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
        height: 240,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _displayDate(),
                  Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              calendar.previousMonth();
                              _generateCalendar();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child:
                                Image.asset("assets/icons/ui/arrow-left.png"),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              calendar.nextMonth();
                              _generateCalendar();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child:
                                Image.asset("assets/icons/ui/arrow-right.png"),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
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
