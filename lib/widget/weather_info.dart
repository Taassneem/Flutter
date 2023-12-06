import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: getWeatherGradient(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weathermodel.cityName,
                    style: const TextStyle(fontSize: 34),
                  ),
                  Text(
                    'updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  weathermodel.image.contains('https:')
                      ? Image.network(weathermodel.image)
                      : Image.network('https:${weathermodel.image}'),
                  Text(
                    '${weathermodel.temp.round()}',
                    style: const TextStyle(fontSize: 34),
                  ),
                  Column(
                    children: [
                      Text(
                        'minTemp: ${weathermodel.tempMin.round()}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        'maxTemp: ${weathermodel.tempMax.round()}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                weathermodel.weatherCondition,
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

LinearGradient getWeatherGradient(String? condition) {
  if (condition == null) {
    return const LinearGradient(
      colors: [Colors.blue, Colors.grey],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
  switch (condition) {
    case 'Sunny':
      return const LinearGradient(
        colors: [Colors.blue, Colors.amber],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case 'Partly cloudy':
      return const LinearGradient(
        colors: [Colors.blue, Colors.grey],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case 'Cloudy':
      return const LinearGradient(
        colors: [Colors.grey, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case 'Overcast':
      return const LinearGradient(
        colors: [Colors.grey, Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case 'Mist':
      return const LinearGradient(
        colors: [Colors.grey, Colors.lightBlue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
      return const LinearGradient(
        colors: [Colors.blue, Colors.grey],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case 'Thundery outbreaks possible':
      return const LinearGradient(
        colors: [Colors.indigo, Colors.yellow],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case 'Blowing snow':
    case 'Blizzard':
      return const LinearGradient(
        colors: [Colors.white, Colors.grey],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    // Add more cases for other weather conditions as needed
    default:
      return const LinearGradient(
        colors: [Colors.blue, Colors.indigo],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  }
}
