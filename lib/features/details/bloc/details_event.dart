import '../../../core/utilities/bloc/bloc_event.dart';

abstract class DetailsEvent extends BlocEvent {}

class GetWeatherInfoEvent extends DetailsEvent {
  @override
  List<Object?> get props => [];
}
