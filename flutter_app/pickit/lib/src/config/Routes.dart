import 'package:flutter/material.dart';
import 'package:pickit/src/pages/AddressNew.dart';
import 'package:pickit/src/pages/HomePage.dart';
import 'package:pickit/src/pages/MainText.dart';
import 'package:pickit/src/pages/NewVehicule.dart';

Route Function(RouteSettings) get routes => (RouteSettings settings) {
      Route route;

      switch (settings.name) {
        case "homePage":
          route = MaterialPageRoute(
              builder: (_) => HomePage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "main":
          route = MaterialPageRoute(
              builder: (_) => MainPage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "addressNew":
          route = MaterialPageRoute(
              builder: (_) => AddressNew(),
              settings: RouteSettings(name: settings.name));
          break;
        case "newVehicule":
          route = MaterialPageRoute(
              builder: (_) => NewVehicule(),
              settings: RouteSettings(name: settings.name));
          break;
        default:
          route = MaterialPageRoute(builder: (_) => DefaultPage());
          break;
      }
      return route;
    };

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Text("This page is a fanta-sea."),
      ),
    );
  }
}
