import 'dart:async';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
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
          height: 430,
          fit:BoxFit.fill),
    Container(
      margin: EdgeInsets.all(20),
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4a47a3), Color(0xFF709fb0)],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
    child: Center(
        child: RaisedButton(
          onPressed: () => _launchSocial('https://www.instagram.com/econtent_systems/', ''),
          child: Text('Follow us on Instagram',
              style: TextStyle(
              fontSize: 16.0,
                  color: Colors.blueGrey,
              fontWeight: FontWeight.bold
          ),),
    ),
    ),
    ),
            Container(
              margin: EdgeInsets.all(20),
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4a47a3), Color(0xFF709fb0)],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: Center(
                child: RaisedButton(
                  onPressed: () => _launchSocial('https://www.facebook.com/econtentsys/', ''),
                  child: Text('Follow us on Facebook',
                    style: TextStyle(
                        fontSize: 16.2,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold
                    ),),
                ),
              ),
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


