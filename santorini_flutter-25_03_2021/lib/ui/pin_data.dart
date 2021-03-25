import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:santorini_flutter/locations.dart';
import 'package:santorini_flutter/pages/aboutthisapppage.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
import 'package:santorini_flutter/locations.dart' as locations;
import 'package:share/share.dart';

class MarkerInfo {
  final String img;
  final String video;
  final String title;
  final String descr;
  final String path;

  // ignore: sort_constructors_first
  MarkerInfo({
    this.img,
    this.video,
    this.title,
    this.descr,
    this.path,
  });

  // ignore: sort_constructors_first
  factory MarkerInfo.fromJson(Map<dynamic, dynamic> parsedJson){
    return MarkerInfo(
        img: parsedJson['img'],
        video : parsedJson['video'],
        title : parsedJson ['title'],
        descr : parsedJson ['descr'],
        path: parsedJson ['path']
    );
  }
}


class PinData extends StatefulWidget {
  PinData({Key key}) : super(key: key);

  @override
  _PinDataState createState() => _PinDataState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PinDataState extends State<PinData> {
  Future<MarkerInfo> findmarker(int i) async {
    final googleOffices = await locations.getGoogleOffices();
    print("pinmarker");
    var marker_chars = {};
    for (final office in googleOffices) {
      for (final office1 in office.monuments) {
        if (office1.pin.pinId == i) {
          marker_chars = {'img': office1.img, 'video': office1.video, 'title': office1.translations[0].en.title, 'descr': office1.translations[0].en.longDescr, 'path': office1.path, 'panoramics': office1.panoramics };
        }
      }
    }
    return MarkerInfo.fromJson(marker_chars);
  }

  @override
  Widget build(BuildContext context) {
    final int markedID = ModalRoute.of(context).settings.arguments;
      return FutureBuilder<MarkerInfo>(
      future: findmarker(markedID), // a previously-obtained Future<String> or null
      // ignore: missing_return
      builder: (context, AsyncSnapshot<MarkerInfo> snapshot) {
        if (snapshot.hasData) { return Scaffold(
          appBar: AppBar(
              title: Text(snapshot.data.title),
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
          body: ListView(
          children: [
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('images/monuments/' + snapshot.data.path + 'gallery/' + snapshot.data.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                /*Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('images/akrotirithera.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('images/akrotirithera.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('images/akrotirithera.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('images/akrotirithera.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),*/
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                //autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                    Text(
                        snapshot.data.title, textAlign: TextAlign.center),
                    Divider(
                    color: Colors.black
                    ),
                    Text(snapshot.data.descr, style: TextStyle(fontSize: 10.0,), textAlign: TextAlign.center),
                    ],
                    ),
            ),),
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
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SideBarLayout()),
                );},
              ),
            ),
          ],
        ),

    );
  } else if (snapshot.hasError) {
      return new Text("${snapshot.error}");
    };
},);}}