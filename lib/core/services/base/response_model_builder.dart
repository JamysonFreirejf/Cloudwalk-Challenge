import '../../models/forecast/forecast_response.dart';
import '../../models/weather/weather_response.dart';
import '../../utilities/builder/object_builder_factory.dart';

mixin BuilderFactory {
  static ObjectBuilderFactory buildObjects =
      (Map<String, dynamic> json) => <Type, ObjectBuilder>{
            WeatherResponse: () => WeatherResponse.fromJson(json),
            WeatherMainResponse: () => WeatherMainResponse.fromJson(json),
            WeatherDataResponse: () => WeatherDataResponse.fromJson(json),
            ForecastResponse: () => ForecastResponse.fromJson(json),
          };
}
