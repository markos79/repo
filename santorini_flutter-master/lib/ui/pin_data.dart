import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:santorini_flutter/ui/volcaloes_map.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:santorini_flutter/locations.dart';
import 'package:santorini_flutter/pages/aboutthisapppage.dart' as about;
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
import 'package:santorini_flutter/locations.dart' as locations;
import 'package:share/share.dart';
import 'package:favorite_button/favorite_button.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:santorini_flutter/ui/video_items.dart';
import 'package:santorini_flutter/ui/panorama.dart';
import 'package:video_player/video_player.dart';
import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';

class MarkerInfo {
  final int id;
  final List<String> img;
  final String video;
  final String title;
  final String panorama;
  final String descr;
  final String path;
  bool favourite;

  // ignore: sort_constructors_first
  MarkerInfo({
    this.id,
    this.img,
    this.video,
    this.title,
    this.panorama,
    this.descr,
    this.path,
    this.favourite
  });

  factory MarkerInfo.fromRawJson(String str) => MarkerInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarkerInfo.fromJson(Map<dynamic, dynamic> json) => MarkerInfo(
    id: json["id"],
    img: List<String>.from(json['img'].map((x) => x)),
    video: json["video"],
    path: json["path"],
    descr: json["descr"],
    title: json["title"],
    panorama: json["panorama"],
    favourite: json["favourite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": List<dynamic>.from(img.map((x) => x)),
    "video": video,
    "title": title,
    "panorama": panorama,
    "descr": descr,
    "path": path,
    "favourite": favourite,
  };
}

Future<String> get _localPath async {
  final directory = await getExternalStorageDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/monument-list.json');
}

class PanoramaArguments {
  String path;
  String panorama;

  PanoramaArguments(this.path, this.panorama);
}


void updateFile(String key, bool fav) async {
  print("Writing to file!");
  final file = await _localFile;
  print(file);
  final googleOffices = await locations.getGoogleOffices();
  List<Locations> updatelist = googleOffices.toList();
  for (Locations office in updatelist) {
    for (Monument office1 in office.monuments) {
      if (office1.pin.pinId.toString() == key){
          print(office1.favourite);
          office1.favourite = fav;
          print(json.encode(googleOffices).toString());
          file.writeAsStringSync(json.encode(googleOffices));
      }
    }
  }
  await getGoogleOffices();
}

bool test(int i) {
  if (favorites_list.favorites.contains(i)){
    return true;
  } else {
    return false;
  }
}

void test2(bool a, int i){
  if ( a==true ){
    favorites_list.favorites.add(i);
  }else {
    favorites_list.favorites.remove(i);
  }
}

class PinData extends StatefulWidget {
  @override
  _PinDataState createState() => _PinDataState();
}



/// This is the private State class that goes with MyStatefulWidget.
class _PinDataState extends State<PinData> {
  File _imageFile;
  Future<MarkerInfo> findmarker(int i) async {
    var googleOffices = await locations.getGoogleOffices();
    var marker_chars = {};
    for (final office in googleOffices) {
      for (final office1 in office.monuments) {
        if (office1.pin.pinId == i) {
          marker_chars = {
            'id': office1.id,
            'img': office1.img,
            'video': office1.video,
            'title': office1.translations[0].en.title,
            'descr': office1.translations[0].en.longDescr,
            'path': office1.path,
            'panorama': office1.panorama,
            'favourite': office1.favourite
          };
        }
      }
    }
    return MarkerInfo.fromJson(marker_chars);
  }

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
    final int markedID = ModalRoute
        .of(context)
        .settings
        .arguments;
    if (markedID != null) {
      return FutureBuilder<MarkerInfo>(
        future: findmarker(markedID),
        // a previously-obtained Future<String> or null
        // ignore: missing_return
        builder: (context, AsyncSnapshot<MarkerInfo> snapshot) {
          if (snapshot.hasData) {
            return DefaultTabController(
                length: 4,
                child:Scaffold(
              resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                      bottom: TabBar(
                        unselectedLabelColor: Color(0xFF6f94fa),
                        labelColor: Colors.white,
                        indicatorWeight: 5,
                        indicatorColor: Color(0xFF6f94fa),
                        tabs: [
                          Tab(icon: Icon(Icons.menu_book), text: "Text",),
                          Tab(icon: Icon(Icons.terrain), text: "Gallery",),
                          Tab(icon: Icon(Icons.satellite), text: "Video",),
                          Tab(icon: Icon(Icons.panorama), text: "Panorama",),
                        ],
                      ),
                    //title: Text(snapshot.data.title),
                    backgroundColor: Color(0xFF3b5188),
                    actions: <Widget>[
                    IconButton(icon: Icon(Icons.share),
                        onPressed: () {
                          Share.share(
                              'check out my website https://www.econtentsys.gr/');
                        }
                    ),
                    FavoriteButton(
                      isFavorite: test(snapshot.data.id),
                      iconSize: 40.0,
                      valueChanged: (_isStarred) {
                        print('Is Starred : $_isStarred');
                        updateFile(
                            markedID.toString(), snapshot.data.favourite);
                        test2(_isStarred, snapshot.data.id);
                      },
                    ),
                    IconButton(
                        icon: const Icon(Icons.home),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                              SideBarLayout()),);
                        })
                  ]
              ),
                  body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),

                  children: [
                    SingleChildScrollView(
                    child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset('images/monuments/' + snapshot.data.path + 'gallery/' +
                            snapshot.data.img[0],
                            fit: BoxFit.cover,
                        ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          snapshot.data.title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,),
                        ),),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          child: Text(snapshot.data.descr,
                            style: TextStyle(fontSize: 16.0,),
                            textAlign: TextAlign.justify),
                        ),
                      ],
                    ),
                  ),),
                Stack(
                children: <Widget> [
                  Container(
                      child: CarouselSlider(
                        items: <Widget>[
                          for (var i = 0; i < snapshot.data.img.length; i++)
                            Container(
                              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/monuments/' + snapshot.data.path + 'gallery/' +
                                      snapshot.data.img[i]),
                                  fit: BoxFit.fitHeight,
                                ),
                                // border:
                                //     Border.all(color: Theme.of(context).accentColor),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                        ],
                          //Slider Container properties
                          options: CarouselOptions(
                            height: 500.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                    ),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF6f94fa),
                          ),
                          child: Text(snapshot.data.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,),
                          ),
                        ),],),
                ],),
                    Stack(
                      children: <Widget> [
                        _videoFile(snapshot.data.path, snapshot.data.video),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF6f94fa),
                              ),
                              child: Text(snapshot.data.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,),
                              ),
                            ),],),
                      ],),
                    Stack(
                      children: <Widget> [
                        _panoramaFile(snapshot.data.path, snapshot.data.panorama),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF6f94fa),
                              ),
                              child: Text(snapshot.data.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,),
                              ),
                            ),],),
                      ],),
            ],
            ),),);
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          };
        },);
    }
    else {
      return Container(width: 0.0, height: 0.0);
    };
  }

  Container _videoFile (String path, String video) {
    print('video/' + path + video);
  if (video.contains('.mp4')){
    return Container(
      child: VideoItems(
        videoPlayerController: VideoPlayerController.asset(
        'video/' + path + video
        ),
        looping: false,
        autoplay: false,
    ),
    );}
    else {
      return Container(width: 0, height: 0);
  }
  }
  Container _panoramaFile (String path, String panorama) {
    print('images/panorama/' + path + panorama);
    if (panorama.contains('.jpg')){
      return Container(
        margin: EdgeInsets.all(20),
        child: Panorama(
            zoom: 1,
            sensitivity: 2.0,
          animSpeed: 1.0,
          child: Image.asset('images/panorama/' + path + panorama)
        )
      );}
    else {
      return Container(width: 0, height: 0);
    }
  }

  ListView _carousel(data) {
    return ListView.builder(
      //scrollDirection: Axis.vertical,
      //shrinkWrap: true,
        primary: false,
        shrinkWrap: true,
        itemCount: data.img == null ? 0 : data.img.length,
        itemBuilder: (context, int index) {
          return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: _carouselItems(
                  context, data.path, data.img[index])
          );
        }
    );
  }

  // ignore: missing_return
  Container _carouselItems(BuildContext context, String path, String image) {
    print('images/monuments/' + path + 'gallery/' +
        image);
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage('images/monuments/' + path + 'gallery/' +
              image),
          fit: BoxFit.cover,
        ),
      ),);
  }
}

