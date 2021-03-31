// To parse this JSON data, do
//
//     final locations = locationsFromJson(jsonString);

import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:santorini_flutter/ui/pin_data.dart';
import 'package:santorini_flutter/ui/volcaloes_map.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

@JsonSerializable()
class Locations {
  Locations({
    this.catId,
    this.img,
    this.monuments,
  });

  final int catId;
  final String img;
  List<Monument> monuments;

  factory Locations.fromRawJson(String str) => Locations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
    catId: json["cat_id"],
    img: json["img"],
    monuments: List<Monument>.from(json["monuments"].map((x) => Monument.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "img": img,
    "monuments": List<dynamic>.from(monuments.map((x) => x.toJson())),
  };
}

@JsonSerializable()
class Monument {
  Monument({
    this.pin,
    this.lat,
    this.lon,
    this.id,
    this.img,
    this.path,
    this.video,
    this.panoramics,
    this.favourite,
    this.translations,
  });

  final Pin pin;
  final double lat;
  final double lon;
  final int id;
  final String img;
  final String path;
  final String video;
  final List<Panoramic> panoramics;
  bool favourite;
  final List<Translation> translations;

  factory Monument.fromRawJson(String str) => Monument.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Monument.fromJson(Map<String, dynamic> json) => Monument(
    pin: Pin.fromJson(json["pin"]),
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    id: json["id"],
    img: json["img"],
    path: json["path"],
    video: json["video"],
    panoramics: List<Panoramic>.from(json["panoramics"].map((x) => Panoramic.fromJson(x))),
    favourite: json["favourite"],
    translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pin": pin.toJson(),
    "lat": lat,
    "lon": lon,
    "id": id,
    "img": img,
    "path": path,
    "video": video,
    "panoramics": List<dynamic>.from(panoramics.map((x) => x.toJson())),
    "favourite": favourite,
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
  };
}

@JsonSerializable()
class Panoramic {
  Panoramic({
    this.rotate,
    this.scale,
    this.img,
    this.panoramichotspots,
  });

  final List<double> rotate;
  final List<int> scale;
  final String img;
  final List<Panoramichotspot> panoramichotspots;

  factory Panoramic.fromRawJson(String str) => Panoramic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Panoramic.fromJson(Map<String, dynamic> json) => Panoramic(
    rotate: List<double>.from(json["rotate"].map((x) => x.toDouble())),
    scale: List<int>.from(json["scale"].map((x) => x)),
    img: json["img"],
    panoramichotspots: List<Panoramichotspot>.from(json["panoramichotspots"].map((x) => Panoramichotspot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rotate": List<dynamic>.from(rotate.map((x) => x)),
    "scale": List<dynamic>.from(scale.map((x) => x)),
    "img": img,
    "panoramichotspots": List<dynamic>.from(panoramichotspots.map((x) => x.toJson())),
  };
}

@JsonSerializable()
class Panoramichotspot {
  Panoramichotspot({
    this.id,
    this.texture,
    this.overlay,
    this.position,
    this.scale,
  });

  final int id;
  final Texture texture;
  final Overlay overlay;
  final Pos position;
  final Pos scale;

  factory Panoramichotspot.fromRawJson(String str) => Panoramichotspot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Panoramichotspot.fromJson(Map<String, dynamic> json) => Panoramichotspot(
    id: json["id"],
    texture: textureValues.map[json["texture"]],
    overlay: overlayValues.map[json["overlay"]],
    position: Pos.fromJson(json["position"]),
    scale: Pos.fromJson(json["scale"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "texture": textureValues.reverse[texture],
    "overlay": overlayValues.reverse[overlay],
    "position": position.toJson(),
    "scale": scale.toJson(),
  };
}

enum Overlay { ASSETS_IMAGES_HOT_SPOT_DETAIL_SAMPLE1_PNG }

final overlayValues = EnumValues({
  "assets/images/hotSpotDetailSample1.png": Overlay.ASSETS_IMAGES_HOT_SPOT_DETAIL_SAMPLE1_PNG
});

@JsonSerializable()
class Pos {
  Pos({
    this.x,
    this.y,
    this.z,
  });

  final double x;
  final double y;
  final double z;

  factory Pos.fromRawJson(String str) => Pos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pos.fromJson(Map<String, dynamic> json) => Pos(
    x: json["x"].toDouble(),
    y: json["y"].toDouble(),
    z: json["z"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "z": z,
  };
}

enum Texture { ASSETS_TEXTURES_HOTSPOT_PNG }

final textureValues = EnumValues({
  "assets/textures/hotspot.png": Texture.ASSETS_TEXTURES_HOTSPOT_PNG
});

@JsonSerializable()
class Pin {
  Pin({
    this.pinId,
    this.src,
    this.texture,
    this.pos,
    this.visibledistance,
  });

  final int pinId;
  final Src src;
  final String texture;
  final Pos pos;
  final int visibledistance;

  factory Pin.fromRawJson(String str) => Pin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pin.fromJson(Map<String, dynamic> json) => Pin(
    pinId: json["pin_id"],
    src: srcValues.map[json["src"]],
    texture: json["texture"],
    pos: Pos.fromJson(json["pos"]),
    visibledistance: json["visibledistance"],
  );

  Map<String, dynamic> toJson() => {
    "pin_id": pinId,
    "src": srcValues.reverse[src],
    "texture": texture,
    "pos": pos.toJson(),
    "visibledistance": visibledistance,
  };
}

enum Src { ASSETS_MODEL_PIN_PIN_SINGLE_GLTF }

final srcValues = EnumValues({
  "assets/model/pin/pinSingle.gltf": Src.ASSETS_MODEL_PIN_PIN_SINGLE_GLTF
});

@JsonSerializable()
class Translation {
  Translation({
    this.el,
    this.en,
  });

  final El el;
  final El en;

  factory Translation.fromRawJson(String str) => Translation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    el: El.fromJson(json["el"]),
    en: El.fromJson(json["en"]),
  );

  Map<String, dynamic> toJson() => {
    "el": el.toJson(),
    "en": en.toJson(),
  };
}

@JsonSerializable()
class El {
  El({
    this.title,
    this.subtitle,
    this.shortDescr,
    this.longDescr,
  });

  final String title;
  final String subtitle;
  final String shortDescr;
  final String longDescr;

  factory El.fromRawJson(String str) => El.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory El.fromJson(Map<String, dynamic> json) => El(
    title: json["title"],
    subtitle: json["subtitle"],
    shortDescr: json["short_descr"],
    longDescr: json["long_descr"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "short_descr": shortDescr,
    "long_descr": longDescr,
  };
}
@JsonSerializable()
class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

Future<String> get _localPath async {
  final directory = await getExternalStorageDirectory();
  return directory.path;
}

Future<String> _loadLocations() async {
  return await rootBundle.loadString('locations/monument-list.json');
}

Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
}

// ignore: missing_return
Future<List<Locations>> getGoogleOffices() async {
    //await wait(5);
    var jsonString = await _loadLocations();
    final jsonResponse = json.decode(jsonString);
    List<Locations> list = List<Locations>.from(jsonResponse.map((i) => Locations.fromJson(i)));
    return list;
    //final locations = Locations.fromJson(jsonResponse[0]);
    //return locations;
}

Future<Locations> getGoogleOffices1() async {
  var jsonString = await _loadLocations();
  final jsonResponse = json.decode(jsonString);
  final locations = Locations.fromJson(jsonResponse[0]);
  return locations;
}

Future<Locations> getGoogleOffices2() async {
  var jsonString = await _loadLocations();
  final jsonResponse = json.decode(jsonString);
  final locations = Locations.fromJson(jsonResponse[1]);
  return locations;
}

Future<Locations> getGoogleOffices3() async {
  var jsonString = await _loadLocations();
  final jsonResponse = json.decode(jsonString);
  final locations = Locations.fromJson(jsonResponse[2]);
  return locations;
}

Future<Locations> getGoogleOffices4() async {
  var jsonString = await _loadLocations();
  final jsonResponse = json.decode(jsonString);
  final locations = Locations.fromJson(jsonResponse[3]);
  return locations;
}

Future<Locations> getGoogleOffices5() async {
  var jsonString = await _loadLocations();
  final jsonResponse = json.decode(jsonString);
  final locations = Locations.fromJson(jsonResponse[4]);
  return locations;
}
