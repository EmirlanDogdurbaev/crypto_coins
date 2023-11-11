import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
    primarySwatch: Colors.amber,
    dividerColor: Colors.amber,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 60, 255, 0),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.amberAccent),
    textTheme: const TextTheme(
        bodyMedium:
            TextStyle(color: Color.fromARGB(255, 255, 191, 0), fontSize: 25),
        labelMedium: TextStyle(
          color: Color.fromARGB(139, 255, 191, 0),
          fontSize: 20,
        )));
