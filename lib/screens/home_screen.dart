import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/city_screen.dart';

class HomeScreen extends StatefulWidget {
  final Weather? locationWeather;

  const HomeScreen({super.key, this.locationWeather});

  @override
  State<HomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  Future<Weather>? weatherObject;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      weatherObject = Future.value(widget.locationWeather);
    }

    weatherObject = WeatherApi().fetchWeatherForecast(cityName: 'Moscow');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              weatherObject = WeatherApi().fetchWeatherForecast(
                cityName: 'Moscow',
              );
            });
          },
          icon: Icon(Icons.my_location, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              String? tappedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CityScreen();
                  },
                ),
              );

              setState(() {
                weatherObject = WeatherApi().fetchWeatherForecast(
                  cityName: tappedName ?? 'Moscow',
                );
              });
            },
            icon: Icon(Icons.location_city, color: Colors.white),
          ),
        ],
      ),
      body: null,
    );
  }
}
