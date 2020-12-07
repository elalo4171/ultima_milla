import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Selecciona una opcion",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                child: Text("Mandar ubicacion en tiempo real"),
                onPressed: () => Navigator.pushNamed(context, "homePage")),
            RaisedButton(
                child: Text("Crear una ruta"),
                onPressed: () => Navigator.pushNamed(context, "addressNew")),
            RaisedButton(
                child: Text("Agregar un vehiculo"),
                onPressed: () => Navigator.pushNamed(context, "newVehicule"))
          ],
        ),
      ),
    );
  }
}
