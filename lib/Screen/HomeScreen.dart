import 'package:flutter/material.dart';
import 'package:freelancekisan_user/DataModel/Address.dart';
import 'package:freelancekisan_user/Service/AuthService.dart';
import 'package:freelancekisan_user/Service/GeoLocatorService.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Set<Marker> _markers ={};
  Position position;
  String flatNohouseNo;
  String area;
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final geoService = GeoLocatorService();
  @override
  void initState() {
    super.initState();
  }
  Widget _getAddress(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TextFormField(
              onChanged: (value){
                area=value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Required';
                }
                return null;
                },
                decoration: InputDecoration(
                hintText: 'Your Address',
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusColor: Colors.white,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              ),
            ),

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return FutureProvider(
      create: (context)=>geoService.getInitialLocation(),
      child: Scaffold(
          body: Stack(
            children: [
              Consumer<Position>(
                builder: (context,position,widget){
                  return position!=null?GoogleMap(
                    initialCameraPosition: CameraPosition(target: LatLng(position.latitude,position.longitude),
                      zoom: 16,
                    ),
                    markers: _markers,
                    myLocationEnabled: true,
                  ):Center(child: CircularProgressIndicator(),);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 300,
                    child: TextButton(
                      child: Text('Select Category',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),onPressed: ()async{

                             position=  await geoService.getInitialLocation();
                             var coordinates = Coordinates(position.latitude, position.longitude);
                             var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                             UserAddress useraddress = UserAddress(
                                 city: addresses.first.locality,
                                 pinCode: addresses.first.postalCode,
                                 complete: addresses.first.addressLine,
                                 houseNo: flatNohouseNo,
                                 area: area,
                                 latitude: position.latitude.toString(),
                                 longitude: position.longitude.toString(),
                             );
                             Navigator.pushNamed(context, '/WorkerCatScreen');
                           }
                    ),
                  ),
                ),
              ),
              Align(alignment: FractionalOffset.topCenter,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _getAddress(),
              ))
            ],
          ),
          appBar: AppBar(title: Text('Search'),backgroundColor: Colors.green,),

          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(child: Text('Your Profile'),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                ),
                ),
                ListTile(
                  title:Text('Previous Transaction'),
                  onTap: (){

                  },
                ),
                ListTile(
                  title:Text('Rating'),
                  onTap: (){

                  },
                ),
                ListTile(
                  title:TextButton(child: Text('Logout',style: TextStyle(color: Colors.red),),onPressed: (){
                    AuthService().signOut();
                  },),
                ),

              ],
            ),
          ),
        ),
      );
  }
}
