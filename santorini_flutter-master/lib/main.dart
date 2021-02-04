import 'package:flutter/material.dart';
import 'package:santorini_flutter/models/markerModel.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
import 'package:santorini_flutter/tools/tools.dart';
import 'package:share/share.dart';

void main() {
  Tools.markersList.add(MarkersModel(
      1,
      "Θόλος Ναυτίλος",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "36.402728610611994",
      "25.395403795830685",
      "https://lh5.googleusercontent.com/p/AF1QipOOH0jLFo8mbDJpa1KHTMOy8JblseruDfMJw68c=w408-h306-k-no"));
  Tools.markersList.add(MarkersModel(
      2,
      "Κοκκινόπετρα",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "36.366000563254424",
      "25.373773349531035",
      "https://lh5.googleusercontent.com/p/AF1QipOi-x2FjfJwRdGfDakwZC06p1jIlSCpqc5LWhGy=w408-h306-k-no"));
  Tools.markersList.add(MarkersModel(
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
  Tools.markersList2.add(MarkersModel(
      1,
      "Byzantine Castle Ruins",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "36.46313619858921",
      "25.372758617680407",
      "https://lh5.googleusercontent.com/p/AF1QipMAHIC-cHNqWXRaS7N3rZCOhrhFmRzyAOnZdiiN=w408-h271-k-no"));

  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: SideBarLayout(),
  ));
}
