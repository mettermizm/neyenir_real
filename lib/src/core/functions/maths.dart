import 'dart:math';

/// It takes a radius in meters and returns a zoom level
class Maths {
  /// > The function takes a radius in meters and returns a zoom level that will display a circle with
  /// that radius
  ///
  /// Args:
  ///   radius (double): The radius of the circle in meters.
  ///
  /// Returns:
  ///   The zoom level of the map.
  static double getZoomLevel(double radius) {
    double zoomLevel = 11;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 500;
      zoomLevel = 16 - log(scale) / log(2);
    }
    zoomLevel = double.parse(zoomLevel.toStringAsFixed(2));
    return zoomLevel;
  }
}
