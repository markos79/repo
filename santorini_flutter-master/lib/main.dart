import 'package:flutter/material.dart';
import 'package:santorini_flutter/models/markerModel.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
import 'package:santorini_flutter/tools/tools.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Santorini App',
        home: AnimatedSplashScreen(
            duration: 1500,
            splash: 'images/main3.png',
            splashIconSize: 300.0, //double.infinity,
            nextScreen: SideBarLayout(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Color(0xFF6f94fa)
        )
    );
  }
}
