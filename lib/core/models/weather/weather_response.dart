import 'package:cloudwalk_challenge/core/services/base/base_response.dart';
import 'package:cloudwalk_challenge/core/utilities/extension/map_json_extension.dart';

class WeatherResponse extends BaseResponse {
  final WeatherMainResponse? main;
  final List<WeatherDataResponse>? weather;
  final String? name;
  final String? dt;

  WeatherResponse({
    required this.main,
    required this.weather,
    required this.name,
    required this.dt,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      main: json.objectOf<WeatherMainResponse>(
        'main',
      ),
      weather: json.listOf<WeatherDataResponse>(
        'weather',
      ),
      name: json.stringOf(
        'name',
      ),
      dt: json.stringOf(
        'dt_txt',
      ),
    );
  }

  @override
  List<Object?> get props => [main, weather, name, dt];
}

class WeatherDataResponse extends BaseResponse {
  final String? description;

  WeatherDataResponse({
    required this.description,
  });

  factory WeatherDataResponse.fromJson(Map<String, dynamic> json) {
    return WeatherDataResponse(
      description: json.stringOf(
        'description',
      ),
    );
  }

  @override
  List<Object?> get props => [description];
}

class WeatherMainResponse extends BaseResponse {
  final double? temp;
  final double? tempMin;
  final double? tempMax;

  WeatherMainResponse({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory WeatherMainResponse.fromJson(Map<String, dynamic> json) {
    return WeatherMainResponse(
      temp: json.doubleOf(
        'temp',
      ),
      tempMin: json.doubleOf(
        'temp_min',
      ),
      tempMax: json.doubleOf(
        'temp_max',
      ),
    );
  }

  @override
  List<Object?> get props => [temp, tempMin, tempMax];
}
