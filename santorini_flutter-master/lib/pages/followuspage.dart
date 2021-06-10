import 'dart:async';
import 'dart:io';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
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
                icon: const Icon(Icons.home),
                onPressed: () {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);
                })
          ]
      ),
      body: Stack(
          children: <Widget>[
            Image.asset("images/santorini1.png",
                width: 480,
                height: 1710,
                fit:BoxFit.fill),
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
      Center(
      child: Container(
              margin: EdgeInsets.all(20),
              width: 180,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFfffff), Color(0xFFfffff)],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () => _launchSocial('https://www.instagram.com/econtent_systems/', ''),
                padding: EdgeInsets.all(8.0),
                textColor: Colors.blue,
                child: Row(
                  children: <Widget>[
                    ImageIcon(
                      AssetImage('images/twitter.png'),
                      size: 35.0,
                      color:Color(0xFF3b5188),
                    ),
                    Flexible(
                      child: Text('Follow us on Twitter', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFF3b5188)),
                      ),)],),
              ),),),
            Container(
              margin: EdgeInsets.all(11),
              width: 180,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFfffff), Color(0xFFfffff)],
                  begin: FractionalOffset.bottomRight,
                  end: FractionalOffset.bottomRight,
                ),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () => _launchSocial('https://twitter.com/econtentsys', ''),
                padding: EdgeInsets.all(8.0),
                textColor: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ImageIcon(
                      AssetImage('images/instagram.png'),
                      size: 35.0,
                      color: Color(0xFF3b5188),
                    ),
                    Flexible(
                      child: Text('Follow us on Instagram', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFF3b5188)),
                      ),)],),
              ),),
            Container(
              margin: EdgeInsets.all(11),
              width: 180,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFfffff), Color(0xFFfffff)],
                  begin: FractionalOffset.bottomRight,
                  end: FractionalOffset.bottomRight,
                ),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  SideBarLayout()),
                  );
                  },
                padding: EdgeInsets.all(8.0),
                textColor: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Text('Back to Map', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFF3b5188)),
                      ),)],),
              ),
            ),
          ]),
          ],),);
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


