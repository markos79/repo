import 'dart:async';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class Followuspage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("    Follow us"),
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
      body: Column(
          children: <Widget>[
      Image.asset("images/santorini3.png",
          width: 450,
          height: 440,
          fit:BoxFit.fill),
    Container(
    child: Center(
        child: RaisedButton(
          onPressed: () => _launchSocial('https://www.instagram.com/econtent_systems/', ''),
          child: Text('Follow us on Instagram',
              style: TextStyle(
              fontSize: 18.0,
              height: 1,
                  color: Colors.blueGrey,
              fontWeight: FontWeight.bold
          ),),
    ),
    ),
    ),
    ],
    )
    );
  }
}
void _launchSocial(String url, String fallbackUrl) async {
  try {
    bool launched =
    await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }
}


