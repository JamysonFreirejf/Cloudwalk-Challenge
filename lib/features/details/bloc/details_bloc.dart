import 'package:cloudwalk_challenge/core/models/forecast/forecast_response.dart';
import 'package:cloudwalk_challenge/core/models/weather/weather_response.dart';
import 'package:cloudwalk_challenge/features/details/repository/details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/tourPlaces/tour_place.dart';
import '../../../core/utilities/bloc/bloc_event.dart';
import '../../../core/utilities/bloc/bloc_state.dart';
import '../models/weather_data.dart';
import '../models/weather_forecast_data.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<BlocEvent, BlocState> {
  final DetailsRepository _repository;
  TourPlace? _tourPlace;

  DetailsBloc({DetailsRepository? repository})
      : _repository = repository ?? DetailsRepository(),
        super(DetailsInitialState()) {
    on<GetWeatherInfoEvent>((event, emit) async {
      emit(DetailsLoadingState());
      try {
        if (_tourPlace == null) {
          emit(FailedLoadingContentState());
          return;
        }
        final weatherResponse = await _repository.fetchWeatherData(
          latitude: _tourPlace!.coordinates.latitude,
          longitude: _tourPlace!.coordinates.longitude,
        );
        if (weatherResponse is! WeatherResponse) {
          emit(FailedLoadingContentState());
          return;
        }
        final forecastResponse = await _repository.fetchForecast(
          latitude: _tourPlace!.coordinates.latitude,
          longitude: _tourPlace!.coordinates.longitude,
        );
        if (forecastResponse is! ForecastResponse) {
          emit(FailedLoadingContentState());
          return;
        }
        emit(
          SuccessfullyLoadedContentState(
            content: WeatherForecastData(
              WeatherData(weatherResponse, tourPlace),
              forecastResponse.list?.map((e) {
                    return WeatherData(
                      e,
                      null,
                    );
                  }).toList() ??
                  [],
            ),
          ),
        );
      } on Exception catch (e) {
        emit(FailedLoadingContentState(message: e.toString()));
      }
    });
  }

  TourPlace? get tourPlace => _tourPlace;

  void setTourPlace(TourPlace value) {
    _tourPlace = value;
  }
}
