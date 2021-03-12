import 'package:flutter/material.dart';
import 'package:freelancekisan_user/Service/AuthService.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      body: Stack(
        children: [
          GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(22.544,88.340),
            zoom: 15,
          ),
            onMapCreated: _onMapCreated,
            markers: _markers,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
              ),
            ),
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
                  child: Text('Select Category',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          )
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
    );
  }
}
