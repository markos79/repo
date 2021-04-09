import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:share/share.dart';
import 'package:country_icons/country_icons.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));



class Aboutthisapppage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            title: Text("    About this app"),
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
        "Using Augmented Reality technology, this travel-informative application offers 3D presentations of the island’s most important sites such as churches, volcanoes, archaeological sites etc. Tap on your mobile screen in volcanoes, museums, natural exhibits and discover photos, information, locations and trails all over the island of Santorini. This application through mobile offers 360° pictures, panoramic photos, videos, maps and many other information. It is friendly for tourist guides because provides the best possible help to them by updating and displaying the information they are interested in informing their audience. You may be connected to your social media accounts and upload relative photos through app. User has the opportunity for offline access to the application by downloading the app to the mobile phone and receiving all the necessary information without internet connection. Through Augmented Reality (AR) technology we are able to create an artificial environment around the exhibit or the place presented to the user in such a way that has the illusion through mobile that is in a real environment of a particular era.",
          textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15, wordSpacing: 1, letterSpacing: 1),
      ),
    ]
  )
        )
    );
  }
}
