import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rxdart/subjects.dart';

class HomeProvider with ChangeNotifier {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData locationData;
  GoogleMapController googleMapController;

  var currentPosition = BehaviorSubject<CameraPosition>();

  HomeProvider() {
    initLocation();
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
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
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

  close() {
    currentPosition.close();
  }
}
