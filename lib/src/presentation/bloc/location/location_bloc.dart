import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:neyenir_app/src/core/enums/location_enums.dart';
import 'package:neyenir_app/src/core/location/location_manager.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  late Position position;
  final LocationManager _locationManager;
  LocationBloc(this._locationManager) : super(LocationInitial()) {
    on<OnDetermineLocation>((event, emit) async {
      emit(const LocationLoading());

      try {
        final result = await _locationManager.determinePosition();
        emit(LocationSuccess(result));
        position = result;
      } catch (e) {
        emit(LocationError(e as LocationEnums));
        rethrow;
      }
    });
  }
}

// TODO Keep track users location permission
