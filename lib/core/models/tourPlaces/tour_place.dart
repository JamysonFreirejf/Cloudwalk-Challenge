import 'package:equatable/equatable.dart';

class TourPlace extends Equatable {
  final String city;
  final String country;
  final TourCoordinates coordinates;

  String get description => '$city, $country';

  const TourPlace(
    this.city,
    this.country,
    this.coordinates,
  );

  static List<TourPlace> list = [
    const TourPlace(
      'Silverstone',
      'UK',
      TourCoordinates(
        '52.091456349611526',
        '-1.027718674669076',
      ),
    ),
    const TourPlace(
      'São Paulo',
      'Brazil',
      TourCoordinates(
        '-23.555412845876162',
        '-46.63959919245137',
      ),
    ),
    const TourPlace(
      'Melbourne',
      'Australia',
      TourCoordinates(
        '-37.803390967083274',
        '144.97492012957582',
      ),
    ),
    const TourPlace(
      'Monte Carlo',
      'Monaco',
      TourCoordinates(
        '43.74038627035801',
        '7.428588274618829',
      ),
    ),
  ];

  @override
  List<Object?> get props => [city, country, coordinates];
}

class TourCoordinates extends Equatable {
  final String latitude;
  final String longitude;

  const TourCoordinates(
    this.latitude,
    this.longitude,
  );

  @override
  List<Object?> get props => [latitude, longitude];
}
