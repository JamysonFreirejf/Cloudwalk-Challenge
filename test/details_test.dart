import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_challenge/core/models/weather/weather_response.dart';
import 'package:cloudwalk_challenge/core/models/forecast/forecast_response.dart';
import 'package:cloudwalk_challenge/core/utilities/bloc/bloc_event.dart';
import 'package:cloudwalk_challenge/core/utilities/bloc/bloc_state.dart';
import 'package:cloudwalk_challenge/features/details/bloc/details_bloc.dart';
import 'package:cloudwalk_challenge/features/details/bloc/details_event.dart';
import 'package:cloudwalk_challenge/features/details/bloc/details_state.dart';
import 'package:cloudwalk_challenge/features/details/models/weather_data.dart';
import 'package:cloudwalk_challenge/features/details/models/weather_forecast_data.dart';
import 'package:cloudwalk_challenge/features/details/repository/details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'stubs/mock_service.dart';
import 'stubs/mock_tour_place_list.dart';

class MockDetailsBloc extends MockBloc<BlocEvent, BlocState>
    implements DetailsBloc {}

final detailsRepository = DetailsRepository(service: MockService());

Future<void> main() async {
  final currentWeather = await getMockWeatherResponse();
  final forecastWeather = await getMockForecast();

  getWeatherInfo(currentWeather, forecastWeather);
  emptyState();
}

void emptyState() {
  group('Empty State Info', () {
    late DetailsBloc detailsBloc;

    setUp(() async {
      detailsBloc = DetailsBloc(repository: detailsRepository);
    });

    blocTest<DetailsBloc, BlocState>(
      'emits content with empty state',
      build: () => detailsBloc,
      act: (bloc) => bloc.add(GetWeatherInfoEvent()),
      expect: () => [
        DetailsLoadingState(),
        FailedLoadingContentState(),
      ],
    );
  });
}

void getWeatherInfo(
    WeatherResponse currentWeather, ForecastResponse forecastWeather) {
  group('Get Weather Info Test', () {
    late DetailsBloc detailsBloc;
    final weatherData = WeatherData.empty();
    weatherData.mainTemp = '298°';
    weatherData.description = 'moderate rain';
    weatherData.cityName = 'São Paulo';
    weatherData.highTemp = 'H:300°';
    weatherData.lowTemp = 'L:298°';

    setUp(() {
      detailsBloc = DetailsBloc(repository: detailsRepository);
      detailsBloc.setTourPlace(MockTourPlacesList.mockSaoPaulo);
    });

    blocTest<DetailsBloc, BlocState>(
      'emits content with success state',
      build: () => detailsBloc,
      act: (bloc) => bloc.add(GetWeatherInfoEvent()),
      expect: () => [
        DetailsLoadingState(),
        SuccessfullyLoadedContentState<WeatherForecastData>(
          content: WeatherForecastData(
            weatherData,
            forecastWeather.list?.map((e) {
                  return WeatherData(
                    e,
                    null,
                  );
                }).toList() ??
                [],
          ),
        ),
      ],
    );
  });
}
