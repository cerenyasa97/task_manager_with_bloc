import 'dart:ui';

import 'package:flutter/material.dart';

class Constants{
  static var darkBlue = Color.fromRGBO(0, 28, 113, 1);
  static var appColor = Color.fromRGBO(2, 30, 114, 1);
  static var lightGrey = Color.fromRGBO(216, 233, 233, 1);
  static var priority = ["1", "2", "3", "4", "5"];

  static var months = ["Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec."];

  static String getCurrentMonth(int monthID){
    return months[monthID];
  }
}