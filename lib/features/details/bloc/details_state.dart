import '../../../core/utilities/bloc/bloc_state.dart';

abstract class DetailsState extends BlocState {}

class DetailsInitialState extends DetailsState {
  @override
  List<Object?> get props => [];
}

class DetailsLoadingState extends DetailsState {
  @override
  List<Object?> get props => [];
}
