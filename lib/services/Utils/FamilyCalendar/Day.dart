import 'package:shophouse/Model/Meal.dart';

class Day {
  /*int weekDayIndex;
  String dayNumber;
  bool isCurrentMonth;*/
  DateTime date;
  List<Meal> meals;

  Day({required this.date, required this.meals});

  int getWeekDayIndex(){
    return this.date.weekday;
  }

  int getDayNumber(){
    return this.date.day;
  }

  bool isCurrentMonth(int month){
    return (this.date.month == month);
  }
}
