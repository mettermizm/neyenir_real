import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// It takes a path to an image, loads the image from the path, and returns a future that completes with
/// the image
class MapUrlToMarker {
  MapUrlToMarker._();

  /// It takes an image path and returns a BitmapDescriptor.
  ///
  /// Args:
  ///   imagePath (String): The path to the image you want to use as a marker.
  ///
  /// Returns:
  ///   A BitmapDescriptor object.
  static Future<BitmapDescriptor> getMarkerIcon(String imagePath) async {
    Size size = const Size(75.0, 75.0);

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint borderPaint = Paint()..color = Colors.white;
    const double borderWidth = 3.0;
    const double imageOffset = borderWidth;

    // Add border circle
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
      borderPaint,
    );

    // Oval for the image
    Rect oval = Rect.fromLTWH(
      imageOffset,
      imageOffset,
      size.width - (imageOffset * 2),
      size.height - (imageOffset * 2),
    );

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    ui.Image image = await _getImageFromPath(imagePath);
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.cover);

    // Convert canvas to image
    final ui.Image markerAsImage =
        await pictureRecorder.endRecording().toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  /// It takes a path to an image, loads the image from the path, and returns a future that completes
  /// with the image
  ///
  /// Args:
  ///   imagePath (String): The path to the image.
  ///
  /// Returns:
  ///   A Future<ui.Image>
  static Future<ui.Image> _getImageFromPath(String imagePath) async {
    final ByteData imageData = await NetworkAssetBundle(Uri.parse(imagePath)).load("");
    final Uint8List imageBytes = imageData.buffer.asUint8List();

    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }
}
