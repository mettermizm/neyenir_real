part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnDetermineLocation extends LocationEvent {
  const OnDetermineLocation();

  @override
  List<Object> get props => [];
}
