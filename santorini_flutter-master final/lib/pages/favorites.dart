import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_resolution.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/src/material/circle_avatar.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:santorini_flutter/locations.dart';
import 'package:santorini_flutter/ui/volcaloes_map.dart';
import 'package:santorini_flutter/ui/pin_data.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';

class FavoritesPage extends StatefulWidget with NavigationStates {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("    Favorites"),
          backgroundColor: Color(0xFF3b5188),
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
                icon: const Icon(Icons.map),
                onPressed: () {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);
                })
          ]
      ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(children: <Widget>[
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
              child: Pins(),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4a47a3), Color(0xFF709fb0)],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                child: Text(
                  'Back to Map',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        SideBarLayout()),
                  );
                },
              ),
            ),
          ],
          ),
            ),
    );
  }
}

class Pins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return FutureBuilder<List<Locations>>(
        future: getGoogleOffices(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return _pinsView(data);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      );
    }
  }

  ListView _pinsView(data) {
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

  // ignore: missing_return
  Container _markerItems(BuildContext context, Monument markerdata) {
  if (favorites_list.favorites.contains(markerdata.pin.pinId)) {
    return Container(
        margin: EdgeInsets.all(1.0),
        decoration: const BoxDecoration(
          color: Color(0xFfffffd),
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
                          textAlign: TextAlign.center,),
                        Divider(
                            color: Colors.white
                        ),
                        Text('Tap to vew details',
                            style: new TextStyle(fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,),
                        )
                      ],
                    ),

                  ),
                ],)),
        ));
  } else {
    return Container(
      width: 0,
      height: 0,
    );
  }
}
