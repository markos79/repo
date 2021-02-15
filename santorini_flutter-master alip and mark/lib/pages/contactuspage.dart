import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
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
                  Share.share('check out my website https://example.com');
                }
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
          Image.asset("images/santorini4.png",
              width: 450,
              height: 80,
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
          child: Text('Submit'),
    )
    )
        ]
      ),
    );
  }
}


