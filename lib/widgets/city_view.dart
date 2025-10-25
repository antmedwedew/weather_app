import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/utils.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<Weather> snapshot;

  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    String city = snapshot.data!.city.name;
    String country = snapshot.data!.city.country;
    List<ListElement> forecastList = snapshot.data!.list;
    DateTime formatedDate = DateTime.fromMillisecondsSinceEpoch(
      forecastList[0].dt * 1000,
    );

    return Column(
      children: <Widget>[
        Text(
          '$city, $country',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        Text(
          Utils.getFormatedDate(formatedDate),
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
