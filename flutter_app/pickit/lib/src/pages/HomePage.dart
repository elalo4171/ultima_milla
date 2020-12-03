import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickit/src/config/Util.dart';
import 'package:pickit/src/config/responsive.dart';
import 'package:pickit/src/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    HomeProvider model = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Container(
        height: _responsive.height * .6,
        child: StreamBuilder<CameraPosition>(
            stream: model.currentPosition,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: snapshot.data,
                  onMapCreated: (GoogleMapController controller) {
                    controller.setMapStyle(Util.mapStyleRetro);
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
