import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final _formKey = GlobalKey<FormState>();

class Contactusppage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("    Contact us"),
          backgroundColor: Color(0xFF3b5188),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.share),
                onPressed: () {
                  Share.share('check out our website https://www.econtentsys.gr/');
                }
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
          Image.asset("images/santorini2.png",
              width: 450,
              height: 1000,
              fit: BoxFit.fill),
          new ListTile(
            contentPadding: EdgeInsets.only(left:35.0,top: 5.0, bottom: 5.0, right:35.0),
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(left:35.0,top: 45.0, bottom: 45.0, right:35.0),
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(left:35.0,top: 85.0, bottom: 85.0,right:35.0),
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
                ),
                ),
    ),
    Container(
    padding: EdgeInsets.all(158.00),
    child: ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false
            // otherwise.
            if (_formKey.currentState.validate()) {
              // If the form is valid, display a Snackbar.
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
            }
          },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue[900])),
          child: Text('Submit'),
    )
    ),
        ]
      ),
    );
  }
}


