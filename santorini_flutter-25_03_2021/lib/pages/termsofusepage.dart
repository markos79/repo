import 'package:flutter/material.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class Termsofusepage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            title: Text("   Terms of use"),
            backgroundColor: Color(0xFF3b5188),
            actions: <Widget>[
              IconButton(icon:Icon(Icons.share),
                  onPressed:(){
                    Share.share('check out my website https://example.com');}
              ),
              IconButton(
                  icon: const Icon(Icons.add_alert),
                  tooltip: 'Show Snackbar',
                  onPressed: () {
                    scaffoldKey.currentState.showSnackBar(snackBar);
                  })
            ]
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
                children: <Widget>[
                  Text(
                    "",
                    style: TextStyle(
                        fontSize: 22.0,
                        height: 3,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "1. This page (together with the documents referred to on it) tells you the terms of use (the “Terms of Use”) on which you may make use of our “Santorini App” application for mobile devices (the “App”). Please read these Terms of Use carefully before you download, install or use the App. By downloading, installing or using the App, you indicate that you accept these Terms of Use and that you agree to abide by them. Your download, installation or use of the App constitutes your acceptance of these Terms of Use which takes effect on the date on which you download, install or use the App. If you do not agree with these Terms of Use, you should cease downloading, installing or using the App immediately.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15, wordSpacing: 1, letterSpacing: 1),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4a47a3), Color(0xFF709fb0)],
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                      ),
                    ),
                    child: FlatButton(
                      child: Text(
                        'Back to Map',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SideBarLayout()),
                      );},
                    ),
                  ),
                ]
            )
        )
    );
  }
}