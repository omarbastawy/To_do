import 'package:flutter/material.dart';

class My_themeData{
  static const colorlightScaffoldBackground =
  Color.fromARGB(255, 223, 236, 219);
  static final ThemeData light_Them=
      ThemeData(
        primarySwatch: Colors.blue ,
        scaffoldBackgroundColor:colorlightScaffoldBackground,
          textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            color: Colors.black

          ),
            headline2: TextStyle(
              fontSize: 14,
                  color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontSize: 14,
                  color: Colors.black45
            )
      )
      );
}