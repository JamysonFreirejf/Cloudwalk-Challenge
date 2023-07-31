// ignore_for_file: depend_on_referenced_packages
import 'package:cloudwalk_challenge/core/models/forecast/forecast_request.dart';
import 'package:cloudwalk_challenge/core/models/forecast/forecast_response.dart';
import 'package:cloudwalk_challenge/core/models/weather/weather_request.dart';
import 'package:cloudwalk_challenge/core/models/weather/weather_response.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:cloudwalk_challenge/core/services/base/base_service.dart';
import '../utilities/provider/app_path_provider.dart';

abstract class WeatherServiceType {
  Future<WeatherResponse> fetchCurrentWeather(
    String latitude,
    String longitude,
  );

  Future<ForecastResponse> fetchForecast(
    String latitude,
    String longitude,
  );
}

class WeatherService with BaseService implements WeatherServiceType {
  final Dio _provider = Dio();

  WeatherService() {
    _provider.interceptors.add(HttpFormatter());
    _provider.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore(AppPathProvider.path),
          policy: CachePolicy.refreshForceCache,
          hitCacheOnErrorExcept: [],
          maxStale: const Duration(
            days: 2,
          ),
          priority: CachePriority.high,
        ),
      ),
    );
  }

  @override
  Future<WeatherResponse> fetchCurrentWeather(
    String latitude,
    String longitude,
  ) async {
    final WeatherRequest request = WeatherRequest(
      latitude: latitude,
      longitude: longitude,
    );
    return await execute<WeatherResponse>(
      request,
      _provider,
    );
  }

  @override
  Future<ForecastResponse> fetchForecast(
    String latitude,
    String longitude,
  ) async {
    final ForecastRequest request = ForecastRequest(
      latitude: latitude,
      longitude: longitude,
    );
    return await execute<ForecastResponse>(
      request,
      _provider,
    );
  }
}
