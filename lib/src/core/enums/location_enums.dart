enum LocationEnums {
  locationServiceDisabled(
    '''Location services are disabled. Please turn on your devices location service.''',
  ),
  locationPermissionDenied(
    '''Location permissions are denied. Please allow location permissions.''',
  ),
  locationPermissionPermanentDenied(
    '''Location permissions are permanently denied, we cannot request permissions. Please allow location permissions.''',
  ),
  locationError('Something went wrong'),
  locationSuccess('Success');

  const LocationEnums(this.description);
  final String description;
}
