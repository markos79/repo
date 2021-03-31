import 'dart:async';
import 'dart:io';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class Followuspage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("    Follow us"),
            backgroundColor: Color(0xFF3b5188),
              leading: IconButton(
                icon: Image.asset('assets/images/pins/logo.png'),
                onPressed: () => exit(0),
              ),
            actions: <Widget>[
              IconButton(icon:Icon(Icons.share),
                  onPressed:(){
                    Share.share('check out our website https://www.econtentsys.gr/');}
              ),
              IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.FavoritesClickedEvent);
                  }),
              IconButton(
                  icon: const Icon(Icons.map),
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);
                  })
            ]
        ),
      body: Column(
          children: <Widget>[
      Image.asset("images/santorini3.png",
          width: 450,
          height: 450,
          fit:BoxFit.fill),
    Container(
      margin: EdgeInsets.all(20),
      width: 221,
      height: 36,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3b5188), Color(0xFF3b5188)],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
    child: Center(
        child: RaisedButton(
          onPressed: () => _launchSocial('https://www.instagram.com/econtent_systems/', ''),
          child: Text('Follow us on Instagram',
              style: TextStyle(
              fontSize: 18.0,
              height: 2,
                  color: Colors.blueGrey,
              fontWeight: FontWeight.bold
          ),),
    ),
    ),
    ),
            Container(
              margin: EdgeInsets.all(20),
              width: 221,
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3b5188), Color(0xFF3b5188)],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: Center(
                child: RaisedButton(
                  onPressed: () => _launchSocial('https://twitter.com/econtentsys', ''),
                  child: Text('   Follow us on Twitter   ',
                    style: TextStyle(
                        fontSize: 18.0,
                        height: 2,
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


