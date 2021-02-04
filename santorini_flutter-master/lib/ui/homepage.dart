import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:share/share.dart';
import 'package:country_icons/country_icons.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(""),
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
      body: new Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('images/main.jpg'),
                fit: BoxFit.cover)
        ),
    child: Stack(
      children: <Widget>[
        Center(
          child: Container(
            margin: const EdgeInsets.all(48.0),
            padding: const EdgeInsets.symmetric(
            horizontal: 24.0, vertical: 36.0),
            decoration: BoxDecoration(
              color: Color(0xFF0277bd).withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.0)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                sigmaX: 1.0,
                sigmaY: 1.0,
              ),
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Text(
                  "Santorini Guide",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                  "Welcome to ......",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0)),
                  const SizedBox(height: 30.0),
                  SizedBox(
                  width: double.infinity,
                    child: RaisedButton(
                    elevation: 0,
                    highlightElevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                      child: Text("Map"),
                      onPressed: () { BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);},
                      ),
                ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 0,
                      highlightElevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text("Exit"),
                      onPressed: () { exit(0);},
                    ),
                  ),
                ],
              ),
          ),),
      ),
      ],
      ),
      ),
    );
  }
}