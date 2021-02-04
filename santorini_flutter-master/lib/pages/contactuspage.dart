import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class Contactusppage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("       Contact us"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          Image.asset("images/iconcontact.png",
              width: 420,
              height: 400,
              fit:BoxFit.fill),
          Container(
            padding: EdgeInsets.all(15.00),
            child: Text(
                "https://www.econtentsys.gr\nDervenakion 9 \nKorydallos 18122 Athens\nTel. +302104959066 \nMob: +306944261239\ninfo@econtentsys.gr",
              style: TextStyle(
                  fontSize: 17.0,
                  height: 1.5,
                  fontWeight: FontWeight.bold
          ),
          )
          )
        ],
      ),
    );
  }
}