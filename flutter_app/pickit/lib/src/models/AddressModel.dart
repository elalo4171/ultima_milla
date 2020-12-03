import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    this.response,
  });

  Response response;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        response: Response.fromJson(json["Response"]),
      );

  Map<String, dynamic> toJson() => {
        "Response": response.toJson(),
      };
}

class Response {
  Response({
    this.metaInfo,
    this.view,
  });

  MetaInfo metaInfo;
  List<View> view;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        metaInfo: MetaInfo.fromJson(json["MetaInfo"]),
        view: List<View>.from(json["View"].map((x) => View.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "MetaInfo": metaInfo.toJson(),
        "View": List<dynamic>.from(view.map((x) => x.toJson())),
      };
}

class MetaInfo {
  MetaInfo({
    this.timestamp,
  });

  String timestamp;

  factory MetaInfo.fromJson(Map<String, dynamic> json) => MetaInfo(
        timestamp: json["Timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "Timestamp": timestamp,
      };
}

class View {
  View({
    this.type,
    this.viewId,
    this.result,
  });

  String type;
  int viewId;
  List<Result> result;

  factory View.fromJson(Map<String, dynamic> json) => View(
        type: json["_type"],
        viewId: json["ViewId"],
        result:
            List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "ViewId": viewId,
        "Result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.relevance,
    this.matchLevel,
    this.matchType,
    this.location,
  });

  double relevance;
  String matchLevel;
  String matchType;
  Location location;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        relevance: json["Relevance"].toDouble(),
        matchLevel: json["MatchLevel"],
        matchType: json["MatchType"],
        location: Location.fromJson(json["Location"]),
      );

  Map<String, dynamic> toJson() => {
        "Relevance": relevance,
        "MatchLevel": matchLevel,
        "MatchType": matchType,
        "Location": location.toJson(),
      };
}

class Location {
  Location({
    this.locationId,
    this.locationType,
    this.displayPosition,
    this.navigationPosition,
    this.mapView,
    this.address,
  });

  String locationId;
  String locationType;
  DisplayPosition displayPosition;
  List<DisplayPosition> navigationPosition;
  MapView mapView;
  Address address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        locationId: json["LocationId"],
        locationType: json["LocationType"],
        displayPosition: DisplayPosition.fromJson(json["DisplayPosition"]),
        navigationPosition: List<DisplayPosition>.from(
            json["NavigationPosition"].map((x) => DisplayPosition.fromJson(x))),
        mapView: MapView.fromJson(json["MapView"]),
        address: Address.fromJson(json["Address"]),
      );

  Map<String, dynamic> toJson() => {
        "LocationId": locationId,
        "LocationType": locationType,
        "DisplayPosition": displayPosition.toJson(),
        "NavigationPosition":
            List<dynamic>.from(navigationPosition.map((x) => x.toJson())),
        "MapView": mapView.toJson(),
        "Address": address.toJson(),
      };
}

class Address {
  Address({
    this.label,
    this.country,
    this.state,
    this.city,
    this.district,
    this.street,
    this.houseNumber,
    this.postalCode,
    this.additionalData,
  });

  String label;
  String country;
  String state;
  String city;
  String district;
  String street;
  String houseNumber;
  String postalCode;
  List<AdditionalDatum> additionalData;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        label: json["Label"],
        country: json["Country"],
        state: json["State"],
        city: json["City"],
        district: json["District"],
        street: json["Street"],
        houseNumber: json["HouseNumber"],
        postalCode: json["PostalCode"],
        additionalData: List<AdditionalDatum>.from(
            json["AdditionalData"].map((x) => AdditionalDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Label": label,
        "Country": country,
        "State": state,
        "City": city,
        "District": district,
        "Street": street,
        "HouseNumber": houseNumber,
        "PostalCode": postalCode,
        "AdditionalData":
            List<dynamic>.from(additionalData.map((x) => x.toJson())),
      };
}

class AdditionalDatum {
  AdditionalDatum({
    this.value,
    this.key,
  });

  String value;
  String key;

  factory AdditionalDatum.fromJson(Map<String, dynamic> json) =>
      AdditionalDatum(
        value: json["value"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "key": key,
      };
}

class DisplayPosition {
  DisplayPosition({
    this.latitude,
    this.longitude,
  });

  double latitude;
  double longitude;

  factory DisplayPosition.fromJson(Map<String, dynamic> json) =>
      DisplayPosition(
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
      };
}

class MapView {
  MapView({
    this.topLeft,
    this.bottomRight,
  });

  DisplayPosition topLeft;
  DisplayPosition bottomRight;

  factory MapView.fromJson(Map<String, dynamic> json) => MapView(
        topLeft: DisplayPosition.fromJson(json["TopLeft"]),
        bottomRight: DisplayPosition.fromJson(json["BottomRight"]),
      );

  Map<String, dynamic> toJson() => {
        "TopLeft": topLeft.toJson(),
        "BottomRight": bottomRight.toJson(),
      };
}

class MatchQuality {
  MatchQuality({
    this.country,
    this.state,
    this.city,
    this.district,
    this.street,
    this.houseNumber,
  });

  int country;
  int state;
  int city;
  int district;
  List<double> street;
  int houseNumber;

  factory MatchQuality.fromJson(Map<String, dynamic> json) => MatchQuality(
        country: int.parse(json["Country"].toString()),
        state: json["State"],
        city: json["City"],
        district: json["District"],
        street: List<double>.from(json["Street"].map((x) => x.toDouble())),
        houseNumber: json["HouseNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "State": state,
        "City": city,
        "District": district,
        "Street": List<dynamic>.from(street.map((x) => x)),
        "HouseNumber": houseNumber,
      };
}
