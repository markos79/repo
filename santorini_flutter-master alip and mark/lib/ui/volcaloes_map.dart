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
import '../tools/tools.dart';
import 'package:santorini_flutter/locations.dart' as locations;
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:share/share.dart';
import 'package:country_icons/country_icons.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

const LatLng _center = const LatLng(36.391318013479655, 25.414449798616467);
LatLng newPosition;
CameraPosition newCameraPosition = CameraPosition(
    target: LatLng(36.391318013479655, 25.414449798616467), zoom: 11);
var maptype = MapType.satellite;
int i=2;
ValueNotifier valueNotifier = ValueNotifier(i);


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
    final selectedMarkerIcon = await getBytesFromAsset('images/marker1.png', 100);
    final googleOffices = await locations.getGoogleOffices(i);
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          icon: BitmapDescriptor.fromBytes(selectedMarkerIcon),
          infoWindow: InfoWindow(

            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
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
                                colors: [Color(0xFF3b5188), Color(0xFF91a2d0)]),
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
                                colors: [Color(0xFF3b5188), Color(0xFF91a2d0)]),
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
                                colors: [Color(0xFF3b5188), Color(0xFF91a2d0)]),
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
                              AssetImage('images/churches.png'),
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
                                colors: [Color(0xFF3b5188), Color(0xFF91a2d0)]),
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
                                  colors: [Color(0xFF3b5188), Color(0xFF91a2d0)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              i=1;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(2.0),
                            textColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/paths.png'),
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
                color: Colors.white,
                shadows: [BoxShadow(blurRadius: 5.0,spreadRadius: 2.0,color: const Color(0x11000000))],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0,),
                        ),
                        Text(
                          'Λίστα',
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Divider(
                    height: 0.5,
                    color: Colors.grey[300],
                  ),
                  Flexible(
                    child: Container(
                      child: ListView.separated(
                        controller: scrollController,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('list item $index'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 0.5,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 20,
                      ),
                      color: Colors.white,
                    ),
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