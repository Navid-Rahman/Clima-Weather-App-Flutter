import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  // Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      // LocationPermission permission;
      // permission = await Geolocator.checkPermission();
      // permission = await Geolocator.requestPermission();
      // if (permission == LocationPermission.denied) {
      //   return Future.error('Location permissions are denied');
      // }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low );
      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    } catch (e) {
      print(e);
    }
  }
}
