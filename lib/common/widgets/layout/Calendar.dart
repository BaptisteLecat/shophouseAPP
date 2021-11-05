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
          color: primaryColor, fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  Text _weekDay(Day day) {
    return Text(
      day.getDayNumber().toString(),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: (day.isGivedMonth(this.calendar.getMonth()))
              ? secondaryColorLessOpacity
              : bodyTextColor2,
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
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
    List<Text> dayNumbersWidget;
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
        height: 250,
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
                  _displayDate(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            calendar.previousMonth();
                            _generateCalendar();
                          });
                        },
                        child: Container(
                            height: 10, width: 10, color: primaryColor),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            calendar.nextMonth();
                            _generateCalendar();
                          });
                        },
                        child: Container(
                            height: 10, width: 10, color: primaryColor),
                      ),
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
