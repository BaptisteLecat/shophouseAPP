import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Octobre 2021"),
                  Container(height: 10, width: 10, color: primaryColor),
                  Container(height: 10, width: 10, color: primaryColor)
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Lun"),
                        Text("Mar"),
                        Text("Mer"),
                        Text("Jeu"),
                        Text("Ven"),
                        Text("Sam"),
                        Text("Dim"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("27"),
                        Text("28"),
                        Text("29"),
                        Text("30"),
                        Text("01"),
                        Text("02"),
                        Text("03"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("04"),
                        Text("05"),
                        Text("06"),
                        Text("07"),
                        Text("08"),
                        Text("09"),
                        Text("10"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
