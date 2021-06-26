import 'package:flutter/material.dart';

class AppStateNotifier extends ChangeNotifier {
  //

  bool isDarkMode = false;

  void updateTheme(bool isDarkMode) async {
    this.isDarkMode = isDarkMode;

    notifyListeners();
  }
}

Color themecolor = Color(0xFF121212);

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: themecolor,
      accentColor: Colors.black,
      shadowColor: Colors.black87,
      primaryColorLight: Colors.white,
      fontFamily: "Noto",
      textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFF989898),
          ),
          headline6: TextStyle(color: Color(0xffAA96DA)),
          headline2: TextStyle(color: Color(0xff222831)),
          headline3: TextStyle(color: Color(0xff222831)),
          headline4: TextStyle(color: Color(0xffDDDDDD)),
          bodyText2: TextStyle(color: Color(0xFFF05454)),
          headline1: TextStyle(color: Color(0xFF989898))),
      inputDecorationTheme: InputDecorationTheme(fillColor: Colors.grey[700]),
      primaryColor: Colors.black,
      canvasColor: Color(0xFFe84545),
      disabledColor: Color(0xFF53354a),
      indicatorColor: Color(0xFF903749),
      cardColor: Color(0xFF161616),
      backgroundColor: Color(0xFF2b2e4a));
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFffe3c9),
      primaryColor: Colors.white,
      primaryColorLight: Colors.black,
      fontFamily: "Noto",
      shadowColor: Colors.grey,
      accentColor: Colors.white,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Color(0xffAA96DA)),
          headline4: TextStyle(color: Color(0xffFCBAD3)),
          headline2: TextStyle(color: Color(0xFFFFFFD2).withOpacity(0.5)),
          headline3: TextStyle(color: Color(0xfffffff)),
          bodyText2: TextStyle(color: Color(0xFFA8D8EA)),
          headline1: TextStyle(color: Colors.grey[700])),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey,
      ),
      canvasColor: Color(0xFF9f5f80),
      disabledColor: Color(0xFF583d72),
      cardColor: Color(0xFFffcfa2),
      indicatorColor: Color(0xFF9f5f80),
      backgroundColor: Color(0xFFffaf63));
}
