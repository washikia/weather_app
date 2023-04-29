import 'package:geolocator/geolocator.dart';
import 'networking.dart';


class Location{
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try{
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(permission);
    latitude = position.latitude;
    longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}