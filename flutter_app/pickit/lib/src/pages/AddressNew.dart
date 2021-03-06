import 'package:flutter/material.dart';
import 'package:pickit/src/models/AddressModel.dart';
import 'package:pickit/src/provider/AddressProvider.dart';
import 'package:provider/provider.dart';

class AddressNew extends StatelessWidget {
  const AddressNew({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddressProvider(),
      builder: (context, _) => Consumer<AddressProvider>(
        builder: (context, model, _) => BuildAddressNew(
          model: model,
        ),
      ),
    );
  }
}

class BuildAddressNew extends StatelessWidget {
  const BuildAddressNew({
    Key key,
    this.model,
  }) : super(key: key);
  final AddressProvider model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creando ruta optimizada"),
      ),
      body: Form(
        key: model.form,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildAddress(model.address, Theme.of(context)),
              TextFormField(
                validator: requiredField,
                decoration: InputDecoration(
                  hintText: "Calle",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => model.calle = value,
              ),
              TextFormField(
                validator: requiredField,
                decoration: InputDecoration(
                  hintText: "Num Ext",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => model.numExt = value,
              ),
              TextFormField(
                validator: requiredField,
                decoration: InputDecoration(
                  hintText: "Colonia",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => model.colonia = value,
              ),
              TextFormField(
                validator: requiredField,
                decoration: InputDecoration(
                  hintText: "Ciudad",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => model.ciudad = value,
              ),
              TextFormField(
                validator: requiredField,
                decoration: InputDecoration(
                  hintText: "Estado",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => model.estado = value,
              ),
              TextFormField(
                validator: requiredField,
                decoration: InputDecoration(
                  hintText: "Pais",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => model.pais = value,
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                  child: Text("Agregar direccion"),
                  onPressed: () {
                    if (model.isValidForm) {
                      model.doPost();
                    }
                  }),
              RaisedButton(
                  child: Text("Evitar direccion"),
                  onPressed: () {
                    if (model.isValidForm) {
                      model.doPost();
                    }
                  }),
              RaisedButton(
                  child: Text("Crear ruta"),
                  onPressed: () {
                    if (model.address.length > 1) {}
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Container buildAddress(List<AddressModel> list, ThemeData themeData) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          AddressModel addressModel = list[index];
          return ListTile(
            trailing: Icon(Icons.pin_drop, color: themeData.accentColor),
            leading: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  model.removeAddress(addressModel);
                }),
            title: Text(
                addressModel.response.view[0].result[0].location.address.label),
            subtitle: Text(addressModel.response.view[0].result[0].location
                    .navigationPosition[0].latitude
                    .toString() +
                " " +
                addressModel.response.view[0].result[0].location
                    .navigationPosition[0].longitude
                    .toString()),
          );
        },
      ),
    );
  }

  String requiredField(String value) {
    String error;
    if (value.isEmpty) {
      error = "Este campo es obligatorio";
    }
    return error;
  }
}
