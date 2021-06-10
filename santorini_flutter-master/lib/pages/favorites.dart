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
                icon: const Icon(Icons.home),
                onPressed: () {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);
                })
          ]
      ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  colors: [Color(0xFF6f94fa), Color(0xFF6f94fa)],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),),
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
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: MaterialButton(
            onPressed: () {
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PinData(),
                    settings: RouteSettings(
                        arguments: markerdata.pin.pinId)));
              }
            },
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    _buildParallaxBackground(context, markerdata),
                    _buildGradient(),
                    _buildTitleAndSubtitle(markerdata),
                  ],
                ),
              ),
            ),
          )
      ),);
  } else {
    return Container(
      width: 0,
      height: 0,
    );
  }
}
Widget _buildParallaxBackground(BuildContext context, Monument markerdata) {
  return Image.asset('images/monuments/' + markerdata
      .path + 'gallery/' + markerdata.img[0],
    width: double.infinity,
    fit: BoxFit.fitWidth,
  );
}

Widget _buildGradient() {
  return Positioned.fill(
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.6, 0.95],
        ),
      ),
    ),
  );
}

Widget _buildTitleAndSubtitle(Monument markerdata) {
  return Positioned(
    left: 20,
    bottom: 20,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          markerdata.translations[0].en.title.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Text(
          //markerdata.translations[0].en.subtitle.toString(),
          //style: const TextStyle(
          //  color: Colors.white,
           // fontSize: 12,
          //),
       // ),
        Text('Tap to vew details',
        style: new TextStyle(fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,),),
      ],
    ),
  );
}
