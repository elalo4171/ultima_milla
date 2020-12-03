import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  var form = GlobalKey<FormState>();

  bool get isValidForm => form.currentState.validate();
  String calle;
  String numExt;
  String numInt;
  String pais;
  String estado;
  String ciudad;
  String colonia;
}
