import 'package:flutter/material.dart';
import 'package:freelancekisan_user/Service/AuthService.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Set<Marker> _markers ={};

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('id-1'),position: LatLng(22.544,88.340)
      ),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(22.544,88.340),
        zoom: 15,
      ),
        onMapCreated: _onMapCreated,
        markers: _markers,
      ),



      appBar: AppBar(title: Text('Search')),

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
              title:Text('Logout'),
              onTap: (){
                AuthService().signOut();
              },
            ),

          ],
        ),
      ),
    );
  }
}
