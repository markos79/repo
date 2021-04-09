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
import 'package:video_player/video_player.dart';
import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';

class MarkerInfo {
  final int id;
  final String img;
  final String video;
  final String title;
  final String descr;
  final String path;
  bool favourite;

  // ignore: sort_constructors_first
  MarkerInfo({
    this.id,
    this.img,
    this.video,
    this.title,
    this.descr,
    this.path,
    this.favourite
  });

  // ignore: sort_constructors_first
  factory MarkerInfo.fromJson(Map<dynamic, dynamic> parsedJson){
    return MarkerInfo(
        id: parsedJson['id'],
        img: parsedJson['img'],
        video : parsedJson['video'],
        title : parsedJson ['title'],
        descr : parsedJson ['descr'],
        path: parsedJson ['path'],
        favourite: parsedJson['favourite']
    );
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
    "video": video,
    "title": title,
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
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                  title: Text(snapshot.data.title),
                  backgroundColor: Color(0xFF3b5188),
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.share),
                        onPressed: () {
                          Share.share(
                              'check out my website https://www.econtentsys.gr/');
                        }
                    ),
                    StarButton(
                      isStarred: test(snapshot.data.id),
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
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MapClickedEvent);
                        })
                  ]
              ),
              body: SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(6.0),
                    child: Image(image: AssetImage(
                        'images/monuments/' + snapshot.data.path + 'gallery/' +
                            snapshot.data.img), fit: BoxFit.contain),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            snapshot.data.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF3b5188)) ,),
                        Divider(
                            color: Colors.transparent
                        ),
                        Text(snapshot.data.descr,
                            style: TextStyle(fontSize: 14.0,),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  VideoItems(
                    videoPlayerController: VideoPlayerController.asset(
                      'video/akrotiri/akrotitri.mp4',
                    ),
                    looping: false,
                    autoplay: false,
                  ),
                ],
              ),
            ),
            );
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          };
        },);
    }
    else {
      return Container(width: 0.0, height: 0.0);
    };
  }
}


