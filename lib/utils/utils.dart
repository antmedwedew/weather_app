import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String getFormatedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(iconData, size: 28),
        SizedBox(height: 10),
        Text('$value', style: TextStyle(fontSize: 20, color: Colors.black)),
        SizedBox(height: 10),
        Text(units, style: TextStyle(fontSize: 20, color: Colors.black)),
      ],
    );
  }
}
