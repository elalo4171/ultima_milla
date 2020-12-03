import 'package:flutter/material.dart';
import 'package:pickit/src/provider/Vehicule.dart';
import 'package:provider/provider.dart';

class NewVehicule extends StatefulWidget {
  NewVehicule({Key key}) : super(key: key);

  @override
  _NewVehiculeState createState() => _NewVehiculeState();
}

class _NewVehiculeState extends State<NewVehicule> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VehiculeProvider(),
      builder: (context, child) => Consumer<VehiculeProvider>(
        builder: (context, model, _) => BuildVehicule(
          model: model,
        ),
      ),
    );
  }
}

class BuildVehicule extends StatelessWidget {
  const BuildVehicule({
    Key key,
    this.model,
  }) : super(key: key);
  final VehiculeProvider model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo vehiculo"),
      ),
      body: Form(
        key: model.form,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedCrossFade(
                crossFadeState: model.showResponse
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500),
                firstChild: Container(
                  child: Text(model.res),
                ),
                secondChild: Column(
                  children: [
                    TextFormField(
                      validator: requiredField,
                      decoration: InputDecoration(
                        hintText: "combustible consumido",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => model.combustibleConsumido = value,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.km = value,
                      decoration: InputDecoration(hintText: "km"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.emisionescape = value,
                      decoration: InputDecoration(hintText: "emision escape"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.capacidad = value,
                      decoration: InputDecoration(hintText: "capacidad"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.combustibleDiesel = value,
                      decoration:
                          InputDecoration(hintText: "tipo combustible diesel"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.combustibleGas = value,
                      decoration:
                          InputDecoration(hintText: "tipo combustible gas"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.combustibleGasolina = value,
                      decoration: InputDecoration(
                          hintText: "tipo combustible gasolina"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.camionFiat = value,
                      decoration:
                          InputDecoration(hintText: "marca camion Fiat"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.camionMercedes = value,
                      decoration:
                          InputDecoration(hintText: "marca camion Mercedes"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.camionRenaut = value,
                      decoration:
                          InputDecoration(hintText: "marca camion Renaut"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.camionVolkswagen = value,
                      decoration:
                          InputDecoration(hintText: "marca camion Volkswagen"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.modeloAmarok = value,
                      decoration: InputDecoration(hintText: "modelo amarok"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.modeloCaddy = value,
                      decoration: InputDecoration(hintText: "modelo caddy"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.transmAutomatica = value,
                      decoration:
                          InputDecoration(hintText: "tipo transm automatica"),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: requiredField,
                      onChanged: (value) => model.transmManual = value,
                      decoration:
                          InputDecoration(hintText: "tipo_transm_manual"),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                  child: Text("Enviar"),
                  onPressed: () {
                    if (model.isValidForm) {
                      print("object");
                      model.doPost();
                    }
                  })
            ],
          ),
        ),
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
