import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/functions/maps_marker_customization.dart';
import 'package:neyenir_app/src/core/functions/maths.dart';
import 'package:neyenir_app/src/presentation/bloc/location/location_bloc.dart';
import 'package:neyenir_app/src/presentation/view/store_view.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key, this.innerView = false}) : super(key: key);

  final bool? innerView;
  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Circle> _circles = {};
  final Set<Marker> _markers = {};

  late CameraPosition _cameraPosition;
  late LatLng currentPosition;
  bool show = false;
  // 1000m
  double radius = 1000;

  void toggleShow() => setState(() => show = !show);

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? 'false';
    currentPosition = LatLng(
      context.read<LocationBloc>().position.latitude,
      context.read<LocationBloc>().position.longitude,
    );

    _cameraPosition = CameraPosition(
      target: currentPosition,
      zoom: Maths.getZoomLevel(radius),
    );

    _circles.add(Circle(
      circleId: const CircleId('area'),
      center: currentPosition,
      radius: radius,
      fillColor: AppColor.danger.withOpacity(.15),
      strokeColor: AppColor.danger.withOpacity(.15),
      strokeWidth: 1,
    ));

    _markers.add(Marker(
      markerId: const MarkerId('1'),
      icon: await MapUrlToMarker.getMarkerIcon(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT92uVfCuZ5QFjZZEsPiGzE0CAEg_JVKdZv0Q&usqp=CAU',
      ),
      position: const LatLng(41.076856644895045, 29.03289321810007),
      onTap: toggleShow,
    ));

    _markers.add(Marker(
      markerId: const MarkerId('2'),
      icon: await MapUrlToMarker.getMarkerIcon(
        'https://media-cdn.tripadvisor.com/media/photo-s/11/54/36/af/nusr-et-logo.jpg',
      ),
      position: const LatLng(41.07931323977356, 29.02837034314871),
      onTap: toggleShow,
    ));

    _markers.add(Marker(
      markerId: const MarkerId('3'),
      icon: await MapUrlToMarker.getMarkerIcon(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0vwbViTqC1Tstao5NY05yHU6lR6S-fLrcVkc02WQI1tC-oMjCDVCdajXm64EKgvJaV_I&usqp=CAU',
      ),
      position: const LatLng(41.082143770230715, 29.029985032975674),
      onTap: toggleShow,
    ));

    _markers.add(Marker(
      markerId: const MarkerId('4'),
      icon: await MapUrlToMarker.getMarkerIcon(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN0CcKFKAW1nHFCqqioFbkJlho3S0HbBoQtS_rNDTy9N78uHSeKStPY4sEB8sCakioIOk&usqp=CAU',
      ),
      position: const LatLng(41.08038683388941, 29.035566039383408),
      onTap: toggleShow,
    ));

    _markers.add(Marker(
      markerId: const MarkerId('5'),
      icon: await MapUrlToMarker.getMarkerIcon(
        'https://pbs.twimg.com/profile_images/1148832801673961472/tiChHJOi_400x400.jpg',
      ),
      position: const LatLng(41.08391860227725, 29.03569377958775),
      onTap: toggleShow,
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.innerView! ? null : AppBar(),
      body: Stack(
        children: [
          GoogleMap(
            circles: _circles,
            markers: _markers,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            scrollGesturesEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: _cameraPosition,
            onMapCreated: _controller.complete,
          ),
          if (show) const StoreCard(),
        ],
      ),
      floatingActionButton: show
          ? FloatingActionButton.extended(
              foregroundColor: AppColor.light,
              backgroundColor: AppColor.primary,
              onPressed: () {},
              label: CustomTextMedium('Yol Tarifi Al', fontSize: 11.sp),
            )
          : const SizedBox(),
    );
  }
}

class StoreCard extends StatelessWidget {
  const StoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 0,
      right: 0,
      child: const StoreView(),
    );
  }
}
