class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weatherCondition;

  const WeatherModel( 
      {required this.cityName,
      required this.date,
      required this.weatherCondition,
      required this.image,
      required this.temp,
      required this.tempMin,
      required this.tempMax,});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      tempMin: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      tempMax: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
