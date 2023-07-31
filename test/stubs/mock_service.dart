import 'dart:convert';
import 'package:cloudwalk_challenge/core/models/forecast/forecast_response.dart';
import 'package:cloudwalk_challenge/core/models/weather/weather_response.dart';
import 'package:cloudwalk_challenge/core/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MockService implements WeatherServiceType {
  @override
  Future<WeatherResponse> fetchCurrentWeather(
      String latitude, String longitude) async {
    return getMockWeatherResponse();
  }

  @override
  Future<ForecastResponse> fetchForecast(
      String latitude, String longitude) async {
    return getMockForecast();
  }
}

Future<WeatherResponse> getMockWeatherResponse() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String response =
      await rootBundle.loadString('assets/mock/weather_current.json');
  final decoded = await json.decode(response);
  return WeatherResponse.fromJson(decoded);
}

Future<ForecastResponse> getMockForecast() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String response =
      await rootBundle.loadString('assets/mock/forecast_weather.json');
  final decoded = await json.decode(response);
  return ForecastResponse.fromJson(decoded);
}
