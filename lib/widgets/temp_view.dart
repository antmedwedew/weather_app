import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<Weather> snapshot;

  const TempView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final List<ListElement> forecastList = snapshot.data!.list;
    final String icon = forecastList[0].getIconUrl();
    final String temp = forecastList[0].temp.day.toStringAsFixed(0);
    final String description = forecastList[0].weather[0].description;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(icon, scale: 0.7),
            SizedBox(width: 20),
            Column(
              children: <Widget>[
                Text(
                  '$temp °С',
                  style: TextStyle(fontSize: 54, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        Text(description, style: TextStyle(fontSize: 18, color: Colors.black)),
      ],
    );
  }
}
