import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class Termsofusepage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
                children: <Widget>[
                  Text(
                    "Terms of use",
                    style: TextStyle(
                        fontSize: 22.0,
                        height: 6,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "1. This page (together with the documents referred to on it) tells you the terms of use (the “Terms of Use”) on which you may make use of our “Santorini App” application for mobile devices (the “App”). Please read these Terms of Use carefully before you download, install or use the App. By downloading, installing or using the App, you indicate that you accept these Terms of Use and that you agree to abide by them. Your download, installation or use of the App constitutes your acceptance of these Terms of Use which takes effect on the date on which you download, install or use the App. If you do not agree with these Terms of Use, you should cease downloading, installing or using the App immediately.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15, wordSpacing: 1, letterSpacing: 1),
                  ),
                ]
            )
        )
    );
  }
}
