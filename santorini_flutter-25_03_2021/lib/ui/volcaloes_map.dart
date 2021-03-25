import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:async';
import "package:flutter/material.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:santorini_flutter/pages/listpage.dart';
import 'package:santorini_flutter/sidebar/sidebar.dart';
import 'package:santorini_flutter/ui/pin_data.dart';
import '../locations.dart';
import '../tools/tools.dart';
import 'package:santorini_flutter/locations.dart' as locations;
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:share/share.dart';

const LatLng _center = const LatLng(36.391318013479655, 25.414449798616467);
LatLng newPosition;
CameraPosition newCameraPosition = CameraPosition(
    target: LatLng(36.41149080455565, 25.406815123863442), zoom: 11.5);
var maptype = MapType.satellite;
int i=0;
ValueNotifier valueNotifier = ValueNotifier(i);

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class MainMapScreen extends StatefulWidget with NavigationStates {
  @override
  _MainScreenState createState() => _MainScreenState();
}
Future<Uint8List> getBytesFromAsset(String path, int width) async {
  var data = await rootBundle.load(path);
  var codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  var fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
      .buffer
      .asUint8List();
}

class _MainScreenState extends State<MainMapScreen> {
  ScrollController scrollController;
  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final selectedMarkerIcon = await getBytesFromAsset('images/marker1.png', 140);
    final googleOffices = await locations.getGoogleOffices();
    final googleOffices1 = await locations.getGoogleOffices1();
    final selectedMarkerIcon1 = await getBytesFromAsset(googleOffices1.img, 140);
    final googleOffices2 = await locations.getGoogleOffices2();
    final selectedMarkerIcon2 = await getBytesFromAsset(googleOffices2.img, 140);
    final googleOffices3 = await locations.getGoogleOffices3();
    final selectedMarkerIcon3 = await getBytesFromAsset(googleOffices3.img, 140);
    final googleOffices4 = await locations.getGoogleOffices4();
    final selectedMarkerIcon4 = await getBytesFromAsset(googleOffices4.img, 140);
    final googleOffices5 = await locations.getGoogleOffices5();
    final selectedMarkerIcon5 = await getBytesFromAsset(googleOffices5.img, 140);
    setState(() {
      switch(i) {
        case 0:
          _markers.clear();
          for (final office in googleOffices) {
            for (final office1 in office.monuments) {
              print('images/' + office1.pin.texture);
              final marker = Marker(
                markerId: MarkerId(office1.id.toString()),
                position: LatLng(office1.lat, office1.lon),
                icon: BitmapDescriptor.fromBytes(selectedMarkerIcon),
                infoWindow: InfoWindow(
                  title: office1.translations[0].el.title,
                  snippet: office1.translations[0].el.subtitle,
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PinData(), settings: RouteSettings(arguments: office1.pin.pinId)),
                  );},
                ),
              );
              _markers[office1.translations[0].el.title] = marker;
            }
          }
          break; // The switch statement must be told to exit, or it will execute every case.
        case 1:
          _markers.clear();
          for (final office in googleOffices1.monuments) {
              final marker = Marker(
                markerId: MarkerId(office.id.toString()),
                position: LatLng(office.lat, office.lon),
                icon: BitmapDescriptor.fromBytes(selectedMarkerIcon1),
                infoWindow: InfoWindow(
                  title: office.translations[0].el.title,
                  snippet: office.translations[0].el.subtitle,
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PinData(), settings: RouteSettings(arguments: office.pin.pinId)),
                  );},
                ),
              );
              _markers[office.translations[0].el.title] = marker;
          }
          break;
        case 2:
          _markers.clear();
          for (final office in googleOffices2.monuments) {
              final marker = Marker(
                markerId: MarkerId(office.id.toString()),
                position: LatLng(office.lat, office.lon),
                icon: BitmapDescriptor.fromBytes(selectedMarkerIcon2),
                infoWindow: InfoWindow(
                  title: office.translations[0].el.title,
                  snippet: office.translations[0].el.subtitle,
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PinData(), settings: RouteSettings(arguments: office.pin.pinId)),
                  );},
                ),
              );
              _markers[office.translations[0].el.title] = marker;
            }
          break; // The switch statement must be told to exit, or it will execute every case.
        case 3:
          _markers.clear();
          for (final office in googleOffices3.monuments) {
            final marker = Marker(
              markerId: MarkerId(office.id.toString()),
              position: LatLng(office.lat, office.lon),
              icon: BitmapDescriptor.fromBytes(selectedMarkerIcon3),
              infoWindow: InfoWindow(
                title: office.translations[0].el.title,
                snippet: office.translations[0].el.subtitle,
                onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PinData(), settings: RouteSettings(arguments: office.pin.pinId)),
                );},
              ),
            );
            _markers[office.translations[0].el.title] = marker;
          }
          break;
        case 4:
          _markers.clear();
          for (final office in googleOffices4.monuments) {
            final marker = Marker(
              markerId: MarkerId(office.id.toString()),
              position: LatLng(office.lat, office.lon),
              icon: BitmapDescriptor.fromBytes(selectedMarkerIcon4),
              infoWindow: InfoWindow(
                title: office.translations[0].el.title,
                snippet: office.translations[0].el.subtitle,
                onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PinData(), settings: RouteSettings(arguments: office.pin.pinId)),
                );},
              ),
            );
            _markers[office.translations[0].el.title] = marker;
          }
          break;
        case 5:
          _markers.clear();
          for (final office in googleOffices5.monuments) {
            final marker = Marker(
              markerId: MarkerId(office.id.toString()),
              position: LatLng(office.lat, office.lon),
              icon: BitmapDescriptor.fromBytes(selectedMarkerIcon5),
              infoWindow: InfoWindow(
                title: office.translations[0].el.title,
                snippet: office.translations[0].el.subtitle,
                onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PinData(), settings: RouteSettings(arguments: office.pin.pinId)),
                );},
              ),
            );
            _markers[office.translations[0].el.title] = marker;
          }
          break;
        default:
          print('Locations Loaded');
      }
});
    valueNotifier.value = i;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("   Santorini Flutter app"),
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
        body: Stack(
        children: <Widget>[
          Container(
            child: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return GoogleMap(
              onMapCreated: _onMapCreated,
                mapType: maptype,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              initialCameraPosition: newCameraPosition,
              markers: _markers.values.toSet(),
            );
            },),),
          Container(
              margin: EdgeInsets.only(left:20.0,right: 20.0, bottom: 20.0),
              height: 75,
              alignment: Alignment.bottomCenter,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF4a47a3), Color(0xFF709fb0)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                                  i=1;
                                  setState(() {
                                  _markers.clear();
                                  GoogleMapController controller;
                                  _onMapCreated(controller);
                                  });
                                  },
                                  padding: EdgeInsets.all(10.0),
                            textColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/archeological.png'),
                              size: 75.0,
                              color: Color(0xFFe0f7fa),
                            ),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF4a47a3), Color(0xFF709fb0)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                              i=2;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(10.0),
                            textColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/church.png'),
                              size: 75.0,
                              color: Color(0xFFe0f7fa),
                            ),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF4a47a3), Color(0xFF709fb0)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                              i=3;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(10.0),
                            textColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/volcano.png'),
                              size: 75.0,
                              color: Color(0xFFe0f7fa),
                            ),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF4a47a3), Color(0xFF709fb0)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                              i=4;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(10.0),
                            textColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/museum.png'),
                              size: 75.0,
                              color: Color(0xFFe0f7fa),
                            ),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color(0xFF4a47a3), Color(0xFF709fb0)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              i=5;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(2.0),
                            textColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/path.png'),
                              size: 90.0,
                              color: Color(0xFFe0f7fa),
                            ),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF4a47a3), Color(0xFF709fb0)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              i=0;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(2.0),
                            textColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/logo_white.png'),
                              size: 90.0,
                              color: Color(0xFFe0f7fa),
                            ),
                          ),),

            ],
          ),),),
          SlidingUpPanelWidget(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: ShapeDecoration(
                color: Color(0xFFd5f2fd),
                shadows: [BoxShadow(blurRadius: 5.0,spreadRadius: 2.0,color: const Color(0xFFa7c5eb))],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0,),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Divider(
                    height: 0.5,
                    color: Colors.grey[300],
                  ),
                  Flexible(
                    child: JobsListView(),
                  ),
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
            controlHeight: 20.0,
            anchor: 0.4,
            panelController: panelController,
            onTap: (){
              ///Customize the processing logic
              if(SlidingUpPanelStatus.expanded==panelController.status){
                panelController.collapse();
              }else{
                panelController.expand();
              }
            },  //Pass a onTap callback to customize the processing logic when user click control bar.
            enableOnTap: true,//Enable the onTap callback for control bar.
          ),
                ],),
              ),);
  }
}