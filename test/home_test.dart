import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_challenge/core/models/tourPlaces/tour_place.dart';
import 'package:cloudwalk_challenge/core/utilities/bloc/bloc_export.dart';
import 'package:cloudwalk_challenge/features/home/bloc/home_bloc.dart';
import 'package:cloudwalk_challenge/features/home/bloc/home_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'stubs/mock_tour_place_list.dart';

class MockHomeBloc extends MockBloc<BlocEvent, BlocState> implements HomeBloc {}

void main() {
  getListTest();
  searchCityTest();
}

void getListTest() {
  group('Get List Test', () {
    late HomeBloc homeBloc;

    setUp(() {
      homeBloc = HomeBloc(list: MockTourPlacesList.mockList);
    });

    blocTest<HomeBloc, BlocState>(
      'emits content with entire list',
      build: () => homeBloc,
      act: (bloc) => bloc.add(GetListEvent()),
      expect: () => [
        SuccessfullyLoadedContentState<List<TourPlace>>(
            content: MockTourPlacesList.mockList)
      ],
    );
  });
}

void searchCityTest() {
  group('Search By City Test', () {
    late HomeBloc homeBloc;

    setUp(() {
      homeBloc = HomeBloc(list: MockTourPlacesList.mockList);
    });

    blocTest<HomeBloc, BlocState>(
      'emits content with entire list if query is empty',
      build: () => homeBloc,
      act: (bloc) => bloc.add(SearchEvent(query: '')),
      expect: () => [
        SuccessfullyLoadedContentState<List<TourPlace>>(
            content: MockTourPlacesList.mockList)
      ],
    );
    blocTest<HomeBloc, BlocState>(
      'emits filtered list if query is not empty',
      build: () => homeBloc,
      act: (bloc) => bloc.add(SearchEvent(query: 'Melbourne')),
      expect: () => [
        SuccessfullyLoadedContentState<List<TourPlace>>(content: [
          MockTourPlacesList.mockMelbourne,
        ])
      ],
    );
    blocTest<HomeBloc, BlocState>(
      'emits filtered list while user is typing',
      build: () => homeBloc,
      act: (bloc) => bloc.add(SearchEvent(query: 'S')),
      expect: () => [
        SuccessfullyLoadedContentState<List<TourPlace>>(content: [
          MockTourPlacesList.mockSilverstone,
          MockTourPlacesList.mockSaoPaulo,
        ])
      ],
    );
  });
}
