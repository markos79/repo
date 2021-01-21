import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:santorini_flutter/sidebar/sidebar.dart';
import 'sidebar/sidebar_layout.dart';

void main() {runApp(MaterialApp(
  title: 'Navigation Basics',
  home: FirstRoute(),
));
}


class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white
      ),
      home: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
            title: Text('Santorini Test Application')),
        body: new Container(
          child: new Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('images/main.jpg'),
                    fit: BoxFit.cover)
            ),
            child: Stack (alignment: Alignment.center, children: <Widget>[
              new SizedBox.fromSize(
                size: Size(150, 150), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.lightBlue, // splash color
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapSample()),
                        );
                      },// button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Start App',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Aleo',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.black
                            ),), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.391318013479655, 25.414449798616467),
    zoom: 12,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(36.391318013479655, 25.414449798616467),
      tilt: 59.440717697143555,
      zoom: 5);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(

        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('Back to menu'),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}


