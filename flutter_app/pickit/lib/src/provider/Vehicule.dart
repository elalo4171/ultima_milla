import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VehiculeProvider with ChangeNotifier {
  var form = GlobalKey<FormState>();

  bool get isValidForm => form.currentState.validate();

  bool showResponse = false;
  String res = "";

  String combustibleConsumido;
  String km;
  String emisionescape;
  String capacidad;
  String combustibleDiesel;
  String combustibleGas;
  String combustibleGasolina;
  String camionFiat;
  String camionMercedes;
  String camionRenaut;
  String camionVolkswagen;
  String modeloAmarok;
  String modeloCaddy;
  String transmAutomatica;
  String transmManual;

  doPost() async {
    var url = 'http://09260d8904d0.ngrok.io/predict';
    var response = await http.post(url, body: {
      "combustibleConsumido": combustibleConsumido,
      "km": km,
      "emisionescape": emisionescape,
      "capacidad": capacidad,
      "combustibleDiesel": combustibleDiesel,
      "combustibleGas": combustibleGas,
      "combustibleGasolina": combustibleGasolina,
      "camionFiat": camionFiat,
      "camionMercedes": camionMercedes,
      "camionRenaut": camionRenaut,
      "camionVolkswagen": camionVolkswagen,
      "modeloAmarok": modeloAmarok,
      "modeloCaddy": modeloCaddy,
      "transmAutomatica": transmAutomatica,
      "transmManual": transmManual,
    });
    if (response.statusCode == 200) {
      showResponse = true;
      res = response.body;
      notifyListeners();
    }
  }
}
