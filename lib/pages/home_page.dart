import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/widget/no_weather_info.dart';
import 'package:weather_app/widget/weather_info.dart';

// import '../widget/weather_info.dart';
import '../cubit/get_weather_state.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherInitial) {
            return const NoWeatherInfo();
          } else if (state is GetWeatherSuccess) {
            return  WeatherInfo(weather: state.weatherModel,);
          } else {
            return const Text('oops, the weather is not available');
          }
        },
      ),
    );
  }
}
