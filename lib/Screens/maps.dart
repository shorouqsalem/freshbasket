// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, sized_box_for_whitespace, prefer_final_fields, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

// services Location:هي خدمة تحديد لموقع الموجوة على التلفونات

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
 Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static const CameraPosition _kGoogle = CameraPosition(
      target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );
 
  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(20.42796133580664, 75.885749655962),
      infoWindow: InfoWindow(
         title: 'My Position',
      //title: AppLocalizations.of(context)!.language,
       
      )
  ),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(AppLocalizations.of(context)!.location),
        backgroundColor: Color(0xFF0F9D58),
        // on below line we have given title of app
  
        //title: Text("My Address"),
      ),
       body: Column(
         children: [
           Container(
            height: 500,
            child: SafeArea(
              // on below line creating google maps
              child: GoogleMap(
              // on below line setting camera position
              initialCameraPosition: _kGoogle,
              // on below line we are setting markers on the map
              markers: Set<Marker>.of(_markers),
              // on below line specifying map type.
              mapType: MapType.normal,
              // on below line setting user location enabled.
              myLocationEnabled: true,
              // on below line setting compass enabled.
              compassEnabled: true,
              // on below line specifying controller on map complete.
              onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                },
              ),
            ),
      ),
      Spacer(),
     //SizedBox(height: 70,),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0F9D58),
        ),
        onPressed: (){
          
        },
         child: 
         Text(AppLocalizations.of(context)!.location))
         ],
       ),
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xFF0F9D58),
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() +" "+value.longitude.toString());
 
            // marker added for current users location
            _markers.add(
                Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );
 
            // specified current users location
            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );
 
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: Icon(Icons.local_activity),
      ),
      
    );
  }
}

