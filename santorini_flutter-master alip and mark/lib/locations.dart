import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
part 'locations.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    this.lat,
    this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Region {
  Region({
    this.coords,
    this.id,
    this.name,
    this.zoom,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);

  final LatLng coords;
  final String id;
  final String name;
  final double zoom;
}

@JsonSerializable()
class Office {
  Office({
    this.address,
    this.id,
    this.image,
    this.lat,
    this.lng,
    this.name,
    this.phone,
    this.region,
  });

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);

  final String address;
  final String id;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String region;
}

@JsonSerializable()
class Locations {
  Locations({
    this.offices,
    this.regions,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Office> offices;
  final List<Region> regions;
}

Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('locations/locations.json');
}

Future<String> _loadAStudentAsset2() async {
  return await rootBundle.loadString('locations/locations2.json');
}
Future wait(int seconds) {
  return Future.delayed(Duration(seconds: seconds), () => {});
}

// ignore: missing_return
Future<Locations> getGoogleOffices(int i) async {
  await wait(2);
  switch(i) {
    case 1: {  var jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    return Locations.fromJson(jsonResponse); }
    break;

    case 2: {  var jsonString2 = await _loadAStudentAsset2();
    final jsonResponse2 = json.decode(jsonString2);
    return Locations.fromJson(jsonResponse2); }
    break;
  }
  // Retrieve the locations of Google offices

}