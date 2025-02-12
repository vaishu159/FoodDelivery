import 'package:flutter/material.dart';

class Responsive {
  static double width(context) => MediaQuery.of(context).size.width;
  static double height(context) => MediaQuery.of(context).size.height;
  static bool isMobile(context) => width(context) < 550;
  static bool isTablet(context) => width(context) > 550 && width(context) < 900;
  static bool isDesktop(context) => width(context) > 900;
}
