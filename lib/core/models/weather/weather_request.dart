import 'package:cloudwalk_challenge/core/services/base/base_request.dart';

class WeatherRequest extends BaseRequest {
  final String latitude;
  final String longitude;

  WeatherRequest({
    required this.latitude,
    required this.longitude,
  });

  @override
  Map<String, dynamic> get params => {
        'lat': latitude,
        'lon': longitude,
        'units': 'metric',
      };

  @override
  String get endpoint => 'weather';
}
