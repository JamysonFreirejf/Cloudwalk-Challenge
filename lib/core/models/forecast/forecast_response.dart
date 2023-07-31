import 'package:cloudwalk_challenge/core/utilities/extension/map_json_extension.dart';
import '../../services/base/base_response.dart';
import '../weather/weather_response.dart';

class ForecastResponse extends BaseResponse {
  final List<WeatherResponse>? list;

  ForecastResponse({
    required this.list,
  });

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    return ForecastResponse(
      list: json.listOf<WeatherResponse>(
        'list',
      ),
    );
  }

  @override
  List<Object?> get props => [list];
}
