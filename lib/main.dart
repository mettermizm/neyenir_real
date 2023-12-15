import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:neyenir_app/main_builder.dart';
import 'package:neyenir_app/src/config/language/language_manager.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/constants/application_constants.dart';
import 'package:neyenir_app/src/core/constants/svg_constants.dart';
import 'package:neyenir_app/src/core/theme/app_theme_light.dart';
import 'package:neyenir_app/src/presentation/bloc/application/application_bloc.dart';
import 'package:neyenir_app/src/presentation/bloc/location/location_bloc.dart';
import 'package:neyenir_app/src/injector.dart' as di;

Future<void> main() async {
  await _initalize();

  runApp(

    EasyLocalization(
      supportedLocales: di.injector<LanguageManager>().supportedLocales,
      path: ApplicationConstants.languageAssetPath,
      child: const MyApp(),
    ),
  );
  
}

/// _initalize() is a function that initializes the app by initializing the dependency injection and
/// loading the environment variables
Future<void> _initalize() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Precaching the logo so that it is loaded before the app starts.
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, SVGConstants.neyenir),
    null,
  );

  /// Initializing the dependency injection.
  di.init();

  /// Loading the environment variables from the .env file.
  await dotenv.load(fileName: ".env.development");

  /// Loading the environment variables from the .env file for non-dart code.
  await FlutterConfig.loadEnvVariables();

  /// ensureInitialized needs to be called in main so that savedLocale is loaded and used from the start.
  await EasyLocalization.ensureInitialized();

  /// This is for the google maps flutter plugin.
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
}

/// Creating an instance of the AppRouter class.
final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// Creating a providers for Application
      providers: [
        BlocProvider(create: (_) => di.injector<ApplicationBloc>()),
        BlocProvider(create: (_) => di.injector<LocationBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, _) {
          return MaterialApp.router(
            /// Builder
            builder: MainBuild.build,
            title: 'Tracker',

            //Theme
            theme: di.injector<LightTheme>().theme,

            //Route
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),

            /// Localizations
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
