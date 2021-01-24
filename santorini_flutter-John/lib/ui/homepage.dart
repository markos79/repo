import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';

import '../tools/tools.dart';
import 'mapScreen.dart';
import '../models/markerModel.dart';

void MapMarkers() {
  Tools.markersList1.add(MarkersModel(
      1,
      "Θόλος Ναυτίλος",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "36.402728610611994",
      "25.395403795830685",
      "https://lh5.googleusercontent.com/p/AF1QipOOH0jLFo8mbDJpa1KHTMOy8JblseruDfMJw68c=w408-h306-k-no"));
  Tools.markersList1.add(MarkersModel(
      2,
      "Κοκκινόπετρα",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "36.366000563254424",
      "25.373773349531035",
      "https://lh5.googleusercontent.com/p/AF1QipOi-x2FjfJwRdGfDakwZC06p1jIlSCpqc5LWhGy=w408-h306-k-no"));
  Tools.markersList1.add(MarkersModel(
      3,
      "Θόλος Ναυτίλος",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "36.43508076235914",
      "25.418567314329266",
      "https://lh5.googleusercontent.com/p/AF1QipOOH0jLFo8mbDJpa1KHTMOy8JblseruDfMJw68c=w408-h306-k-no"));
  Tools.markersList2.add(MarkersModel(
      1,
      "Ακρωτήρι",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "36.35264404466849",
      "25.40351181985181",
      "https://lh5.googleusercontent.com/p/AF1QipPZ9XqQG4Ou2buovdY_de67DPQ-ep1UaHgovuNO=w426-h240-k-no"));
  Tools.markersList2.add(MarkersModel(
      2,
      "Περίβολος",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "36.34624260024006",
      "25.464883349552448",
      "https://lh5.googleusercontent.com/p/AF1QipMYuCm8oZn5JVKzUu-bA6iPoGasT8EZo4-PT7A8=w408-h306-k-no"));
  Tools.markersList3.add(MarkersModel(
      1,
      "Byzantine Castle Ruins",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "36.46313619858921",
      "25.372758617680407",
      "https://lh5.googleusercontent.com/p/AF1QipMAHIC-cHNqWXRaS7N3rZCOhrhFmRzyAOnZdiiN=w408-h271-k-no"));
}

class ScreenArguments {
  var markersList = new List<MarkersModel>();
  ScreenArguments(this.markersList);
}

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    final screenArguments1 = ScreenArguments(Tools.markersList = Tools.markersList1);
    final screenArguments2 = ScreenArguments(Tools.markersList = Tools.markersList2);
    return new Container(
      child: new Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('images/main.jpg'),
                fit: BoxFit.cover)
        ),
        child: new Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                child: Text(
                  'Α Κατηγορία',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainMapScreen(), settings: RouteSettings(arguments: screenArguments1),
                  ),);},
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                child: Text(
                  'B Κατηγορία',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainMapScreen(), settings: RouteSettings(arguments: screenArguments2),
                  ),
                );},
              ),
            ),],
          ),
        ),
      ),
    );
  }
}