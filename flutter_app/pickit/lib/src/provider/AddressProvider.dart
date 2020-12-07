import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pickit/src/models/AddressModel.dart';

class AddressProvider with ChangeNotifier {
  var form = GlobalKey<FormState>();
  List<AddressModel> address = [];

  bool get isValidForm => form.currentState.validate();

  String calle;
  String numExt;
  String numInt;
  String colonia;
  String ciudad;
  String estado;
  String pais;

  doPost() async {
    String search = "$calle $numExt $colonia $ciudad $estado $pais";

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

  removeAddress(AddressModel addressModel) {
    address.removeWhere((element) => addressModel == element);
    notifyListeners();
  }
}
