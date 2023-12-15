import 'package:get_it/get_it.dart';
import 'package:neyenir_app/src/config/language/language_manager.dart';
import 'package:neyenir_app/src/core/caches/local_storage.dart';
import 'package:neyenir_app/src/core/caches/secure_storage.dart';
import 'package:neyenir_app/src/core/location/location_manager.dart';
import 'package:neyenir_app/src/core/network/network_manager.dart';
import 'package:neyenir_app/src/core/theme/app_theme_dark.dart';
import 'package:neyenir_app/src/core/theme/app_theme_light.dart';
import 'package:neyenir_app/src/presentation/bloc/application/application_bloc.dart';
import 'package:neyenir_app/src/presentation/bloc/location/location_bloc.dart';

/// Register all the dependencies that are needed for the app to run.
final injector = GetIt.instance;

void init() {
  //* DB

  //* BLOC
  injector.registerFactory(() => ApplicationBloc());
  injector.registerFactory(() => LocationBloc(injector()));

  //* USECASE

  //* REPOSITORY

  //* DATA SOURCE

  //* NETWORK
  injector.registerLazySingleton(() => NetworkManager());

  //* LANGUAGE
  injector.registerLazySingleton(() => LanguageManager());

  //* LOCATION
  injector.registerLazySingleton(() => LocationManager());

  //* STORAGE
  injector.registerLazySingleton(() => LocalStorageManager());
  injector.registerLazySingleton(() => SecureStorageManager());

  //* THEME
  injector.registerLazySingleton(() => LightTheme());
  injector.registerLazySingleton(() => DarkTheme());
}
