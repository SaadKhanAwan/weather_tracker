import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future getlocation() async {
    try {
      // here i am using await because i want to wait until location is get
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = location.latitude;
      longitude = location.longitude;
      // here i am returning location for future needs
      return location;
    } catch (e) {
      rethrow;
    }
  }
}
