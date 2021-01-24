import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';

import 'tools/tools.dart';
import 'ui/mapScreen.dart';
import 'models/markerModel.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: SideBarLayout(),
  ));
}
