import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/enums/location_enums.dart';
import 'package:neyenir_app/src/presentation/bloc/location/location_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> forceLocationPermissions(BuildContext context, LocationState state) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: Duration.zero,
    pageBuilder: (context, animation, secondaryAnimation) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              // ! MUST REMOVE. USER CAN NOT POP THAT PAGE
              CloseButton(onPressed: () => Navigator.pop(context)),
            ],
          ),
          body: SafeArea(
            child: PagePadding(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text((state.props.first as LocationEnums).description),
                  PrimaryButton(
                    title: 'Ayarlara Git',
                    onPressed: () async => (state.props.first as LocationEnums) ==
                            LocationEnums.locationPermissionDenied
                        ? await openAppSettings()
                        : await Geolocator.openLocationSettings(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
