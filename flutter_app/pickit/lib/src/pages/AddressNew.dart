import 'package:flutter/material.dart';

class AddressNew extends StatefulWidget {
  AddressNew({Key key}) : super(key: key);

  @override
  _AddressNewState createState() => _AddressNewState();
}

class _AddressNewState extends State<AddressNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva direccion"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Calle"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Num Ext"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Num Int"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Colonia"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Ciudad"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Estado"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Pais"),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
              child: Text("Guardar"), onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }
}
