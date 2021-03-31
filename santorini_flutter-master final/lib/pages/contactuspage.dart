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
                icon: const Icon(Icons.map),
                onPressed: () {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);
                })
          ]
      ),
      body: Column(
        children: <Widget>[
          Image.asset("images/santorini4.png",
              width: 450,
              height: 100,
              fit: BoxFit.fill),
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
                ),
                ),
    ),
    Container(
    padding: EdgeInsets.all(18.00),
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


