import 'package:cloudwalk_challenge/core/services/weather_service.dart';

class DetailsRepository {
  DetailsRepository({WeatherServiceType? service})
      : _service = service ?? WeatherService();

  final WeatherServiceType _service;

  Future<dynamic> fetchWeatherData({
    required String latitude,
    required String longitude,
  }) async {
    var response = await _service.fetchCurrentWeather(
      latitude,
      longitude,
    );
    return response;
  }

  Future<dynamic> fetchForecast({
    required String latitude,
    required String longitude,
  }) async {
    var response = await _service.fetchForecast(
      latitude,
      longitude,
    );
    return response;
  }
}
