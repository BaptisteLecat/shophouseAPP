import 'package:shophouse/Model/Meal.dart';

class Day {
  DateTime date;
  List<Meal> meals;

  Day({required this.date, required this.meals});

  int getWeekDayIndex() {
    return this.date.weekday;
  }

  int getDayNumber() {
    return this.date.day;
  }

  bool isGivedMonth(int month) {
    return (this.date.month == month);
  }

  bool isCurrentDay() {
    return (this.date.day == DateTime.now().day);
  }
}
