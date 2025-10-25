import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/utils.dart';

class ForecastCardView extends StatelessWidget {
  final AsyncSnapshot<Weather> snapshot;
  final int index;

  const ForecastCardView({super.key, required this.snapshot, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<ListElement> forecastList = snapshot.data!.list;
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(
      forecastList[index].dt * 1000,
    );
    final String fullDate = Utils.getFormatedDate(date);
    final String dayOfWeek = fullDate.split(',')[0];
    final String tempMin = forecastList[index].temp.min.toStringAsFixed(0);
    final String icon = forecastList[index].getIconUrl();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              dayOfWeek,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '$tempMin °С',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Image.network(icon),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
