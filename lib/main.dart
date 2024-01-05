import 'package:flutter/material.dart';
import 'package:resume_builder/screen/home_screen.dart';
import 'package:resume_builder/screen/menu_screen.dart';
import 'package:resume_builder/screen/option_screen/expirence_screen.dart';
import 'package:resume_builder/screen/option_screen/language_screen.dart';
import 'package:resume_builder/screen/option_screen/personal_screen.dart';
import 'package:resume_builder/screen/option_screen/qulification_screen.dart';
import 'package:resume_builder/screen/option_screen/salary_screen.dart';
import 'package:resume_builder/screen/option_screen/technical_screen.dart';
import 'package:resume_builder/screen/show_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Home_Scrren(),
        "Menu": (context) => Menu_Scrren(),
        "Personal": (context) => Personal(),
        "Quali": (context) => Qualification(),
        "Language": (context) => Language_Scrren(),
        "expi": (context) => Expirence_Scrren(),
        "sal": (context) => Salary_Scrren(),
        "tec": (context) => Technical_Scrren(),
        "show": (context) => Show_Scrren(),
      },
    ),
  );
}
