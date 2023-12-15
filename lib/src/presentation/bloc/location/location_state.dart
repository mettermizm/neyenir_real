part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {
  const LocationLoading();
}

class LocationError extends LocationState {
  const LocationError(this.error);
  final LocationEnums error;

  @override
  List<Object> get props => [error];
}

class LocationSuccess extends LocationState {
  final Position position;
  const LocationSuccess(this.position);

  @override
  List<Object> get props => [position];
}
