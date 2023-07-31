import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import '../../../core/models/tourPlaces/tour_place.dart';
import '../../../core/models/weather/weather_response.dart';

class WeatherData extends Equatable {
  String mainTemp = '';
  String description = '';
  String cityName = '';
  String highTemp = '';
  String lowTemp = '';
  String date = '';
  String formattedDate = '';

  String get highLowTemp => '$highTemp $lowTemp';

  WeatherData.empty();
  WeatherData(WeatherResponse response, TourPlace? tourPlace) {
    mainTemp = '${response.main?.temp?.round().toString() ?? ''}°';
    cityName = tourPlace?.city ?? '';
    highTemp = 'H:${response.main?.tempMax?.round().toString() ?? ''}°';
    lowTemp = 'L:${response.main?.tempMin?.round().toString() ?? ''}°';

    if (response.weather?.isNotEmpty ?? false) {
      description = response.weather?.last.description ?? '';
    }
    if (response.dt != null) {
      final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      final inputDate = inputFormat.parseUTC(response.dt!).toLocal();
      formattedDate = DateFormat('dd MMM hh:mm').format(inputDate);
    }
  }

  @override
  List<Object?> get props => [
        mainTemp,
        description,
        cityName,
        highTemp,
        lowTemp,
        date,
        formattedDate,
      ];
}
