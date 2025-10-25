import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/utils.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<Weather> snapshot;

  const DetailView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    List<ListElement> forecastList = snapshot.data!.list;
    print(forecastList[0].pressure);
    int pressure = forecastList[0].pressure;
    int humidity = forecastList[0].humidity;
    int wind = forecastList[0].speed.round();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Utils.getItem(Icons.compress, (pressure * 0.750062).round(), 'mm Hg'),
        Utils.getItem(Icons.grain_rounded, humidity, '%'),
        Utils.getItem(Icons.arrow_forward_rounded, wind, 'm/s'),
      ],
    );
  }
}
