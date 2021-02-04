import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class Followuspage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "https://www.facebook.com/econtentsys/\n"
        "https://twitter.com/econtentsys\n"
        "https://www.instagram.com/econtent_systems/\n"
        "https://gr.pinterest.com/econtentsys/",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18,letterSpacing: 1),
      ),
    );
  }
}