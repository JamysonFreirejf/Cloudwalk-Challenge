import '../../../core/utilities/bloc/bloc_event.dart';

abstract class HomeEvent extends BlocEvent {}

class GetListEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class SearchEvent extends HomeEvent {
  final String query;

  SearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
