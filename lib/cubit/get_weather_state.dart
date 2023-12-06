import 'package:weather_app/models/weather_model.dart';

class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherSuccess extends GetWeatherState {
  final WeatherModel weatherModel;

  GetWeatherSuccess( this.weatherModel);
}

final class GetWeatherFailure extends GetWeatherState {}
