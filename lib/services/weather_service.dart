import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final String baseURL = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c2ed97311b664c7db45221011233011';
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oop there was an error';
      throw (errorMessage);
    } catch (e) {
      log(e.toString());
      throw ('oop there was an error');
    }
  }
}
