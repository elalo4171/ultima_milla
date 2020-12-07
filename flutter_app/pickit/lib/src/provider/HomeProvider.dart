import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:pickit/src/models/AddressModel.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

class HomeProvider with ChangeNotifier {
  loc.Location location = new loc.Location();

  bool _serviceEnabled;
  loc.PermissionStatus _permissionGranted;
  loc.LocationData locationData;
  GoogleMapController googleMapController;

  var currentPosition = BehaviorSubject<CameraPosition>();

  HomeProvider() {
    initLocation();
    doPost();
  }

  initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude, locationData.longitude),
      zoom: 14.4746,
    );
    currentPosition.sink.add(cameraPosition);
  }

  initTrackerPosition() {
    location.onLocationChanged.listen((position) {
      if (googleMapController != null) {
        LatLng latLng = LatLng(position.latitude, position.longitude);
        try {
          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(
                    latLng.latitude,
                    latLng.longitude,
                  ),
                  zoom: 14.47)));
        } catch (e) {}
      }
    });
  }

  List<AddressModel> address = [];
  doPost() async {
    String search = "5 de mayo 511 Leon Centro";

    var queryParameters = {
      'searchtext': search,
      'apiKey': 'F-L5gR6l8VKr6d0GOiYcTkSBJQwBFY1F-MofVr9Q6Nk',
      'maxresults': "4"
    };
    var uri = new Uri.https(
        "geocoder.ls.hereapi.com", "/search/6.2/geocode.json", queryParameters);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      AddressModel addressModel =
          new AddressModel.fromJson(json.decode(response.body));
      address.add(addressModel);
      print(addressModel.response.view[0].result[0].location.address.label);
      notifyListeners();
    }
  }

  close() {
    currentPosition.close();
  }
}
