import 'package:cloudwalk_challenge/features/details/models/weather_data.dart';
import 'package:equatable/equatable.dart';

class WeatherForecastData extends Equatable {
  WeatherData? currentWeather;
  List<WeatherData> forecast = [];

  WeatherForecastData(this.currentWeather, this.forecast);

  @override
  List<Object?> get props => [currentWeather, forecast];
}
