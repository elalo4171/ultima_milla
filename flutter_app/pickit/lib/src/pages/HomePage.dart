import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickit/src/config/Util.dart';
import 'package:pickit/src/config/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Scaffold(
      body: Container(
        height: _responsive.height * .6,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(Util.mapStyleRetro);
          },
        ),
      ),
    );
  }
}
