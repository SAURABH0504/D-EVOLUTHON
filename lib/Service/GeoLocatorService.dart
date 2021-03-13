import 'package:geolocator/geolocator.dart';

class GeoLocatorService{
   Geolocator geo = Geolocator();

   Stream<Position> getCurrentLocation(){
       return Geolocator.getPositionStream(distanceFilter: 5,desiredAccuracy: LocationAccuracy.high);
   }
   Future<Position> getInitialLocation() async {
     return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   }
}