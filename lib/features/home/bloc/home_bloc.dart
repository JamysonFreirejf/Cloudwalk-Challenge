import 'package:cloudwalk_challenge/core/models/tourPlaces/tour_place.dart';
import 'package:cloudwalk_challenge/features/home/bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utilities/bloc/bloc_event.dart';
import '../../../core/utilities/bloc/bloc_state.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<BlocEvent, BlocState> {
  final List<TourPlace> _list;

  HomeBloc({List<TourPlace>? list})
      : _list = list ?? TourPlace.list,
        super(HomeInitialState()) {
    on<GetListEvent>((event, emit) {
      emit(SuccessfullyLoadedContentState(content: _list));
    });
    on<SearchEvent>((event, emit) {
      final query = event.query;
      if (query.isEmpty) {
        emit(SuccessfullyLoadedContentState(content: _list));
        return;
      }
      final filteredList = _list
          .where((element) =>
              element.city.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(SuccessfullyLoadedContentState(content: filteredList));
    });
  }
}
