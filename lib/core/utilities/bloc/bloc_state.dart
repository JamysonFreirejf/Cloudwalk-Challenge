import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class BlocState extends Equatable {}

@immutable
abstract class GenericPageContent extends Equatable {}

class SuccessfullyLoadedContentState<T> extends BlocState {
  final T content;

  SuccessfullyLoadedContentState({required this.content});

  @override
  List<Object?> get props => <Object>[content as Object];
}

class FailedLoadingContentState<T extends GenericPageContent>
    extends BlocState {
  final String? message;

  FailedLoadingContentState({
    this.message,
  });

  @override
  List<Object?> get props => <Object>[
        message ?? '',
      ];
}
