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
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);
                  }),
            ]
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF6f94fa),
              Color(0xFF9258e8),
            ],
            ),),
            child: Column(children: <Widget>[
              Divider(
                height: 10,
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
                    margin: EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: _tileItem(
                        context, data[index].monuments[index1])
                );
              }
          );
        });
  }

  ExpansionTile _tileItem(BuildContext context, Monument markerdata) {
    return ExpansionTile(
        title: Container(
          margin: EdgeInsets.all(10),
          child: Text(markerdata.translations[0].en.title.toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),),
        trailing: Icon(Icons.arrow_drop_down,size: 32,color: Colors.black,),
        children: [
          Image.asset(
            'images/monuments/' + markerdata
                .path + 'gallery/' + markerdata.img[0],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(markerdata.translations[0].en.shortDescr.toString(), textAlign: TextAlign.justify),),
          FlatButton(
            color: Color(0xFF6f94fa),
              child: Text(
                'Click to view details',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PinData(),
                    settings: RouteSettings(
                        arguments: markerdata.pin.pinId)));
              },
            shape: RoundedRectangleBorder(side: BorderSide(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid
            ), borderRadius: BorderRadius.circular(50)),),
        ]
    );
  }
}
