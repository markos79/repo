import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_resolution.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/src/material/circle_avatar.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:santorini_flutter/ui/pin_data.dart';

import '../locations.dart';
import 'aboutthisapppage.dart';

class ListPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("    Locations List"),
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
                  }),
            ]
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(children: <Widget>[
              Divider(
                height: 0.5,
                color: Colors.transparent,
              ),
              Flexible(
                child: ItemsListView(),
              ),
            ],
            )));
  }
}

class ItemsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Locations>>(
      future: getGoogleOffices(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          return _ItemsListView(data);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }


  ListView _ItemsListView(data) {
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
                    margin: EdgeInsets.all(10),
                    child: _tileItem(
                        context, data[index].monuments[index1])
                );
              }
          );
        });
  }

  ExpansionTile _tileItem(BuildContext context, Monument markerdata) {
    return ExpansionTile(
        backgroundColor: Colors.transparent,
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('images/monuments/' + markerdata
              .path + 'gallery/' + markerdata.img),
        ),
        title: Text(
          markerdata.translations[0].en.title.toString(),
          style: TextStyle(
              fontSize: 16.0, height: 1.3, fontWeight: FontWeight.bold, color: Color(0xFF3b5188)),
        ),
        children: <Widget>[
          ListTile(
            title: Text(markerdata.translations[0].en.shortDescr.toString(),
                textAlign: TextAlign.justify),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: 200,
            height: 25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3b5188), Color(0xFF3b5188)],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
              ),
            ),
            child: FlatButton(
                child: Text(
                  'Click to view details',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PinData(),
                      settings: RouteSettings(
                          arguments: markerdata.pin.pinId)));
                }),
          ),
          //Image.asset('images/monuments/' + markerdata
          //   .path + 'gallery/' + markerdata.img),
        ]
    );
  }
}
