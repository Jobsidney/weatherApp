import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;
  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
