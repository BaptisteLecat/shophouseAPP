import 'package:flutter/material.dart';
import 'constant/colors.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 28.0,
        color: secondaryColor,
      ),
      headline2: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 26.0,
        color: secondaryColor,
      ),
      headline3: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24.0,
        color: secondaryColor,
      ),
      headline4: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22.0,
        color: secondaryColor,
      ),
      headline5: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20.0,
        color: secondaryColor,
      ),
      headline6: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        color: secondaryColor,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        color: bodyTextColor,
      ),
      bodyText2: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.0,
        color: bodyTextColor,
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      //textTheme: Typography().white,
      primaryColor: primaryColor,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor, selectionColor: primaryColor),
      //primaryColor: Color(0xff4829b2),
      indicatorColor: Color(0xFF807A6B),
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      accentColor: Color(0xFFFFF8E1),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20.0,
      ),
      buttonColor: Colors.white,
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}
