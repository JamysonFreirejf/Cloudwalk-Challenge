import 'package:cloudwalk_challenge/core/models/tourPlaces/tour_place.dart';

class MockTourPlacesList {
  static TourPlace mockSilverstone = const TourPlace(
    'Silverstone',
    'UK',
    TourCoordinates(
      '52.091456349611526',
      '-1.027718674669076',
    ),
  );
  static TourPlace mockSaoPaulo = const TourPlace(
    'São Paulo',
    'Brazil',
    TourCoordinates(
      '-23.555412845876162',
      '-46.63959919245137',
    ),
  );
  static TourPlace mockMelbourne = const TourPlace(
    'Melbourne',
    'Australia',
    TourCoordinates(
      '-37.803390967083274',
      '144.97492012957582',
    ),
  );
  static TourPlace mockMonteCarlo = const TourPlace(
    'Monte Carlo',
    'Monaco',
    TourCoordinates(
      '43.74038627035801',
      '7.428588274618829',
    ),
  );

  static final mockList = [
    mockSilverstone,
    mockSaoPaulo,
    mockMelbourne,
    mockMonteCarlo,
  ];
}
