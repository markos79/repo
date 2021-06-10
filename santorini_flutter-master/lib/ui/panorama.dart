import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';
import 'package:santorini_flutter/ui/pin_data.dart';


class PanoramaPage extends StatefulWidget {
  @override
  _PanoramaPageState createState() => _PanoramaPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _PanoramaPageState extends State<PanoramaPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  File _imageFile;
  @override
  Widget build(BuildContext context) {
    final PanoramaArguments panoramaArguments = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Panorama Image"),
        backgroundColor: Color(0xFF3b5188),
      ),
      body: Panorama(
        zoom: 1,
        animSpeed: 1.0,
        child: _imageFile != null ? Image.file(_imageFile) : Image.asset('images/panorama/' + panoramaArguments.path + panoramaArguments.panorama),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3b5188),
        mini: true,
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}