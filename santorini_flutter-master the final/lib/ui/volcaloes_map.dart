import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
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
    target: const LatLng(36.41149080455565, 25.406815123863442), zoom: 11);
var maptype = MapType.satellite;
int i=0;
ValueNotifier valueNotifier = ValueNotifier(i);
bool isSelected1 = false;
bool isSelected2 = false;
bool isSelected3 = false;
bool isSelected4 = false;
bool isSelected5 = false;
bool isSelectedall = true;

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

  Timer timer;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    //timer = Timer.periodic(Duration(seconds: 5), (Timer t) => addValue());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  //void addValue() {
    //setState(() {
      //counter++;
    //});
  //}

  ScrollController scrollController;
  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    var googleOffices = await locations.getGoogleOffices();
    var googleOffices1 = await locations.getGoogleOffices1();
    var selectedMarkerIcon1 = await getBytesFromAsset(googleOffices1.img, 80);
    var googleOffices2 = await locations.getGoogleOffices2();
    var selectedMarkerIcon2 = await getBytesFromAsset(googleOffices2.img, 80);
    var googleOffices3 = await locations.getGoogleOffices3();
    var selectedMarkerIcon3 = await getBytesFromAsset(googleOffices3.img, 80);
    var googleOffices4 = await locations.getGoogleOffices4();
    var selectedMarkerIcon4 = await getBytesFromAsset(googleOffices4.img, 80);
    var googleOffices5 = await locations.getGoogleOffices5();
    var selectedMarkerIcon5 = await getBytesFromAsset(googleOffices5.img, 80);


    BitmapDescriptor pin_image(int catId) {
      switch (catId) {
        case 1:
          return BitmapDescriptor.fromBytes(selectedMarkerIcon1);
          break;
        case 2:
          return BitmapDescriptor.fromBytes(selectedMarkerIcon2);
          break;
        case 3:
          return BitmapDescriptor.fromBytes(selectedMarkerIcon3);
          break;
        case 4:
          return BitmapDescriptor.fromBytes(selectedMarkerIcon4);
          break;
        case 5:
          return BitmapDescriptor.fromBytes(selectedMarkerIcon5);
          break;
      }
    }


    setState(() {
      switch(i) {
        case 0:
          _markers.clear();
          for (final office in googleOffices) {
            for (final office1 in office.monuments) {
              final marker = Marker(
                markerId: MarkerId(office1.id.toString()),
                position: LatLng(office1.lat, office1.lon),
                icon: pin_image(office.catId),
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
            title: Text("Santorini App"),
            backgroundColor: Color(0xFF3b5188),
            leading: IconButton(
              icon: Image.asset('assets/images/pins/logo.png'),
              onPressed: () => exit(0),
            ),
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
        body: Stack(
        children: <Widget>[
          Container(
            child: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return GoogleMap(
              onMapCreated: _onMapCreated,
                mapType: maptype,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                scrollGesturesEnabled: false,
                compassEnabled: false,
                zoomGesturesEnabled: false,
                tiltGesturesEnabled: false,
                rotateGesturesEnabled: false,
                mapToolbarEnabled: false,
                gestureRecognizers: null,
              initialCameraPosition: newCameraPosition,
              markers: _markers.values.toSet(),
            );
            },),),
          Container(
              margin: EdgeInsets.only(left:10.0,right: 10.0, bottom: 20.0),
              height: 90,
              alignment: Alignment.bottomCenter,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(1),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: isSelected1 == false ? [Color(0xFF3b5188), Color(0xFF3b5188)] : [Color(0xFF3b5188), Color(0xFF709999)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                                  i=1;
                                  isSelected1 = true;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  isSelected4 = false;
                                  isSelected5 = false;
                                  isSelectedall = false;
                                  setState(() {
                                  _markers.clear();
                                  GoogleMapController controller;
                                  _onMapCreated(controller);});
                                  },
                                  padding: EdgeInsets.all(5.0),
                                  textColor: Colors.white,
                            child: Column(
                              children: <Widget>[
                               ImageIcon(
                              AssetImage('images/archeological.png'),
                              size: 60.0,
                              color: Color(0xFFe0f7fa),
                            ),
                             Flexible(
                               child: Text('Archeological Sites', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white)),
                             ),],),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: isSelected2 == false ? [Color(0xFF3b5188), Color(0xFF3b5188)] : [Color(0xFF3b5188), Color(0xFF709999)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                              i=2;
                              isSelected1 = false;
                              isSelected2 = true;
                              isSelected3 = false;
                              isSelected4 = false;
                              isSelected5 = false;
                              isSelectedall = false;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(5.0),
                            textColor: Colors.white,
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('images/church.png'),
                                  size: 60.0,
                                  color: Color(0xFFe0f7fa),
                                ),
                                Flexible(
                                  child: Text('Churches', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white)),
                                ),],),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: isSelected3 == false ? [Color(0xFF3b5188), Color(0xFF3b5188)] : [Color(0xFF3b5188), Color(0xFF709999)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                              i=3;
                              isSelected1 = false;
                              isSelected2 = false;
                              isSelected3 = true;
                              isSelected4 = false;
                              isSelected5 = false;
                              isSelectedall = false;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(5.0),
                            textColor: Colors.white,
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('images/volcano.png'),
                                  size: 60.0,
                                  color: Color(0xFFe0f7fa),
                                ),
                                Flexible(
                                  child: Text('Volcanoes', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white)),
                                ),],),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: isSelected4 == false ? [Color(0xFF3b5188), Color(0xFF3b5188)] : [Color(0xFF3b5188), Color(0xFF709999)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            onPressed: () {
                              i=4;
                              isSelected1 = false;
                              isSelected2 = false;
                              isSelected3 = false;
                              isSelected4 = true;
                              isSelected5 = false;
                              isSelectedall = false;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(5.0),
                            textColor: Colors.white,
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('images/museum.png'),
                                  size: 60.0,
                                  color: Color(0xFFe0f7fa),
                                ),
                                Flexible(
                                  child: Text('Museums', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white)),
                                ),],),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: isSelected5 == false ? [Color(0xFF3b5188), Color(0xFF3b5188)] : [Color(0xFF3b5188), Color(0xFF709999)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              i=5;
                              isSelected1 = false;
                              isSelected2 = false;
                              isSelected3 = false;
                              isSelected4 = false;
                              isSelected5 = true;
                              isSelectedall = false;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(5.0),
                            textColor: Colors.white,
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('images/path.png'),
                                  size: 60.0,
                                  color: Color(0xFFe0f7fa),
                                ),
                                Flexible(
                                  child: Text('Paths', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white)),
                                ),],),
                          ),),
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(2.5),
                          height: 75.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: isSelectedall == false ? [Color(0xFF3b5188), Color(0xFF3b5188)] : [Color(0xFF3b5188), Color(0xFF709999)]),
                            borderRadius: BorderRadius.circular(10),),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            onPressed: () {
                              i=0;
                              isSelected1 = false;
                              isSelected2 = false;
                              isSelected3 = false;
                              isSelected4 = false;
                              isSelected5 = false;
                              isSelectedall = true;
                              setState(() {
                                _markers.clear();
                                GoogleMapController controller;
                                _onMapCreated(controller);
                              });
                            },
                            padding: EdgeInsets.all(5.0),
                            textColor: Colors.white,
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('images/all1.png'),
                                  size: 60.0,
                                  color: Color(0xFFe0f7fa),
                                ),
                                Flexible(
                                  child: Text('All', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white)),
                                ),],),
                          ),),

            ],
          ),),),
          Container(
            margin: EdgeInsets.only(top: 30.0, left:15.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 25.0,
                  color: Colors.white.withOpacity(0.4),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 25.0,
                  color: Colors.white.withOpacity(0.4),
                ),
                ],
          ),),
          SlidingUpPanelWidget(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: ShapeDecoration(
                color: Color(0xFF3b5188),
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
                  Icon(
                    Icons.expand_less_rounded,
                    size: 50.0,
                    color: Colors.white,
                  ),
                  Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    height: 5.0,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
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
            controlHeight: 40.0,
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

class favorites_list {
  static List<int> favorites = <int>[];
}

class JobsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    switch (i) {
      case 0:
        return FutureBuilder<List<Locations>>(
          future: getGoogleOffices(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return _jobsListView(data);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        );
        break; // The switch statement must be told to exit, or it will execute every case.
      case 1:
        return FutureBuilder<Locations>(
          future: getGoogleOffices1(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return _jobsListView2(data);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        );
        break;
      case 2:
        return FutureBuilder<Locations>(
          future: getGoogleOffices2(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return _jobsListView2(data);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        );
        break;
      case 3:
        return FutureBuilder<Locations>(
          future: getGoogleOffices3(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return _jobsListView2(data);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        );
        break;
      case 4:
        return FutureBuilder<Locations>(
          future: getGoogleOffices4(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return _jobsListView2(data);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        );
        break;
      case 5:
        return FutureBuilder<Locations>(
          future: getGoogleOffices5(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return _jobsListView2(data);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        );
        break;
      default:
        print('No monuments detected!');
    }
  }

    ListView _jobsListView(data) {
      return ListView.builder(
        //scrollDirection: Axis.vertical,
        //shrinkWrap: true,
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, int index) {
            return ListView.builder(
              //scrollDirection: Axis.vertical,
                primary: false,
                shrinkWrap: true,
                itemCount: data[index].monuments == null ? 0 : data[index]
                    .monuments.length,
                itemBuilder: (context, int index1) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: _markerItems(
                          context, data[index].monuments[index1])
                  );
                }
            );
          });
    }

  ListView _jobsListView2(data) {
    return ListView.builder(
      //scrollDirection: Axis.vertical,
      //shrinkWrap: true,
              primary: false,
              shrinkWrap: true,
              itemCount: data.monuments == null ? 0 : data.monuments.length,
              itemBuilder: (context, int index1) {
                return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: _markerItems(
                        context, data.monuments[index1])
                );
              }
          );
  }

    // ignore: missing_return
    Container _markerItems(BuildContext context, Monument markerdata) {
      return Container(
          margin: EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: Color(0xFF3b5188),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: MaterialButton(
                onPressed: () {
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PinData(),
                        settings: RouteSettings(
                            arguments: markerdata.pin.pinId)));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image(
                              image: AssetImage('images/monuments/' + markerdata
                                  .path + 'gallery/' + markerdata.img),
                              width: 200,
                              height: 100,
                              fit: BoxFit.contain),
                        ],),),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            markerdata.translations[0].en.title.toString(),
                            textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white),),
                          Divider(
                              color: Colors.transparent
                          ),
                          Text('Tap to vew details',
                              style: new TextStyle(fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                                color: Colors.white38,),
                          )
                        ],
                      ),

                    ),
                  ],)),
          ));
    }
  }