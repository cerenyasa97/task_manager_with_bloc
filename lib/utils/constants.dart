import 'dart:ui';

import 'package:flutter/material.dart';

class Constants{
  static var darkBlue = Color.fromRGBO(0, 28, 113, 1);
  static var appColor = Color.fromRGBO(2, 30, 114, 1);
  static var lightGrey = Color.fromRGBO(216, 233, 233, 1);

  static var months = ["Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec."];

  static String currentMonth;

  static String getCurrentMonth(int monthID){
    switch(monthID){
      case 0:
        currentMonth = months[0];
        break;
      case 1:
        currentMonth = months[1];
        break;
      case 2:
        currentMonth = months[2];
        break;
      case 3:
        currentMonth = months[3];
        break;
      case 4:
        currentMonth = months[4];
        break;
      case 5:
        currentMonth = months[5];
        break;
      case 6:
        currentMonth = months[6];
        break;
      case 7:
        currentMonth = months[7];
        break;
      case 8:
        currentMonth = months[8];
        break;
      case 9:
        currentMonth = months[9];
        break;
      case 10:
        currentMonth = months[10];
        break;
      case 11:
        currentMonth = months[11];
        break;
      case 12:
        currentMonth = months[12];
        break;
    }
    return currentMonth;
  }

  static Color priorityShade(int priorityValue){
    switch(priorityValue){
      case 1:
        return Colors.red.shade100;
        break;
      case 2:
        return Colors.red.shade300;
        break;
      case 3:
        return Colors.red.shade500;
        break;
      case 4:
        return Colors.red.shade700;
        break;
      case 5:
        return Colors.red.shade900;
        break;
      default:
        return Colors.white;
    }
  }
}