import 'package:flutter/material.dart';
import 'package:santorini_flutter/models/markerModel.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
import 'package:santorini_flutter/tools/tools.dart';
import 'package:animated_splash/animated_splash.dart';

void main() {

  Function duringSplash = () {
    print('Applications Starting....');
    var a = 123 + 23;
    print(a);

    if (a > 100) {
      return 1;
    } else {
      return 2;
    }
  };
  Map<int, Widget> op = {1: SideBarLayout()};

  runApp(MaterialApp(
      home: AnimatedSplash(
        imagePath: 'images/santorini_logo.png',
        home: SideBarLayout(),
        customFunction: duringSplash,
        duration: 2500,
        type: AnimatedSplashType.BackgroundProcess,
        outputAndHome: op,
      )));
}
