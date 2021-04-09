import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
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
                ]
            )
        )
    );
  }
}
