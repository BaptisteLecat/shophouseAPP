import 'package:dart_date/dart_date.dart';
import 'package:shophouse/common/constant/data.dart';
import 'package:shophouse/services/Utils/FamilyCalendar/Day.dart';
import 'dart:developer';

class Calendar {
  int? givedMonth;
  int? givedYear;
  late DateTime refDate;
  late List<Day> monthDays;

  Calendar({this.givedMonth, this.givedYear}) {
    this.refDate = DateTime.now();
    this.monthDays = [];
  }

  void init() {
    //User want to display a specific month for the current year
    if (this.givedMonth != null && this.givedYear == null) {
      this.refDate =
          DateTime.utc(this.refDate.year, this.givedMonth!, this.refDate.day);
    } else {
      //User want to display a specific month for a specific year
      if (this.givedMonth != null && this.givedYear != null) {
        this.refDate =
            DateTime.utc(this.givedYear!, this.givedMonth!, this.refDate.day);
      }
    }
  }

  int findFirstWeekDayOfMonth() {
    return this.refDate.startOfMonth.weekday;
  }

  int findLastWeekDayOfMonth() {
    return this.refDate.endOfMonth.weekday;
  }

  hydrateListDayWithPreviousMonthDays() {
    int numberOfDayBeforeStartMonth =
        this.findFirstWeekDayOfMonth() - DateTime.monday;
    if (numberOfDayBeforeStartMonth > 0) {
      DateTime decrementedDate = this.refDate.startOfMonth;
      for (var i = numberOfDayBeforeStartMonth; i > 0; i++) {
        decrementedDate = decrementedDate.subtract(Duration(days: 1));
        monthDays.add(Day(date: decrementedDate, meals: []));
      }
    }
  }

  hydrateListDayWithNextMonthDays() {
    int numberOfDayAfterEndMonth =
        DateTime.sunday - this.findLastWeekDayOfMonth();
    if (numberOfDayAfterEndMonth > 0) {
      DateTime incrementedDate = this.refDate.endOfMonth;
      for (var i = 0; i < numberOfDayAfterEndMonth; i++) {
        incrementedDate = incrementedDate.add(Duration(days: 1));
        monthDays.add(Day(date: incrementedDate, meals: []));
      }
    }
  }

  void hydrateListDay() {
    hydrateListDayWithPreviousMonthDays();

    DateTime incrementedDate = this.refDate.startOfMonth;
    //Adding first the first day of month.
    monthDays.add(Day(date: incrementedDate, meals: []));
    for (var i = this.refDate.startOfMonth.day + 1;
        i <= this.refDate.endOfMonth.day;
        i++) {
      incrementedDate = incrementedDate.add(Duration(days: 1));
      monthDays.add(Day(date: incrementedDate, meals: []));
    }

    hydrateListDayWithNextMonthDays();
  }

  Map<int, List<Day>> generateCalendar() {
    Map<int, List<Day>> calendar = {
      1 : [],
      2 : [],
      3 : [],
      4 : [],
      5 : [],
      6 : [],
      7 : [],
    };

    hydrateListDay();
    monthDays.forEach((day) {
      if (calendar.containsKey(day.date.weekday)) {
        print("test");
        calendar[day.date.weekday]!.add(day);
      } else {
        print("testtest");
        List<Day> days = [day];
        calendar[day.date.weekday] = days;
      }
    });

    calendar.forEach((key, value) {
      print(key);
    });

    return calendar;
  }
}
