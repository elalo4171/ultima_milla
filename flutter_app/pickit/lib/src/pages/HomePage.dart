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
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => Consumer<HomeProvider>(
        builder: (context, model, _) => BuildHomePage(model: model),
      ),
    );
  }
}

class BuildHomePage extends StatelessWidget {
  const BuildHomePage({
    Key key,
    @required this.model,
  }) : super(key: key);

  final HomeProvider model;

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
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
                        model.googleMapController = controller;
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Container(
            child: Center(
              child: Column(
                children: [
                  !model.currentPosition.hasValue
                      ? Container()
                      : Text(model.currentPosition.value.target.toString()),
                  RaisedButton(
                      child: Text("Ok"),
                      onPressed: () => Navigator.pop(context))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
