import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherApi {
  Future<Weather> fetchWeatherForecast({String? cityName}) async {
    Map<String, String> queryParams;

    queryParams = {
      'appid': Constants.weatherAppId,
      'units': 'metric',
      'q': cityName ?? '',
    };

    var uri = Uri.https(
      Constants.weatherBaseUrlDomain,
      Constants.weatherPath,
      queryParams,
    );

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return weatherFromJson(response.body);
    } else {
      return Future.error('Error response');
    }
  }
}
