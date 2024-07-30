import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_m/utils/flush_status.dart';
import 'package:flutter_m/utils/utils.dart';

class WeatherProvider extends ChangeNotifier {
  final dio = Dio(BaseOptions(validateStatus: (status) => status! < 505));

  dynamic _weatherData;
  bool _isLoading = true;

  get weatherData => _weatherData;
  get getIsLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /*
    get weather data based on location.
    Note: mainly location is prioritized as city-name.
   */
  Future<void> getCurrentWeather(
    String location,
    BuildContext context,
  ) async {
    print("-------->>> Current weather data invoked");
    // try {
    //   final apiKey = dotenv.env["WEATHER_API_KEY"];
    //   final url = dotenv.env["OPEN_WEATHER_URL"];

    //   final urlEndpoint = "${url}?q=$location,uk&APPID=${apiKey}";

    //   final response = await dio.get(urlEndpoint);

    //   _weatherData = response.data;
    //   print(_weatherData);
    //   setIsLoading(false);
    // } catch (err, s) {
    //   print("--------> stack: $s");
    //   print("------>err: $err");
    //   // Utils.flushBarMessage(err.toString(), context, STATUS.ERROR);
    //   setIsLoading(false);
    // }
  }
}
