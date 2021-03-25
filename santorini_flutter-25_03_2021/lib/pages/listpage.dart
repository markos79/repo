import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_resolution.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
import 'package:santorini_flutter/ui/pin_data.dart';
import 'package:santorini_flutter/ui/volcaloes_map.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/src/material/circle_avatar.dart';
import 'package:flutter/src/widgets/image.dart';

import '../locations.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class ListPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    var panelController;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF3b5188),
          title: Text(
              'List'
          ),actions: <Widget>[
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
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  ExpansionTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/volcano.png"),
                    ),
                    title: Text(
                      "Volcanoes",
                      style: TextStyle(
                          fontSize: 22.0,
                          height: 1,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(height:20.0),
                      ExpansionTile(
                        trailing: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("images/mapmarker.png"),),
                        title: Text(
                            'Nea Kameni'
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                'Nea Kameni especially is a pole of attraction for tourists for its healing hot springs. The yellow waters there contain a large amount of sulfur and are characterized for their therapeutic purposes. Today, Agios Nikolaos, which is the small cove in Nea Kameni islet, is a true health source.'
                                ,textAlign: TextAlign.justify),
                          ),
                          Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Nea_Kameni_volcanic_island_-_Santorini_-_Greece_-_09.jpg/1600px-Nea_Kameni_volcanic_island_-_Santorini_-_Greece_-_09.jpg')
                        ],
                      )
                    ],),
                  ExpansionTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/museum.png"),
                    ),
                    title: Text(
                      "Museums",
                      style: TextStyle(
                          fontSize: 22.0,
                          height: 1,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      ExpansionTile(
                        title: Text(
                          'Archaeological Museum of Firá',
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                'The Archaeological Museum of Firá offers a clear and scientific insight to the human presence on the island, from the Dorian colonization at the dawn of history to late Roman times. Collections of sculptures, inscriptions, clay figurines and painted vases are some of the exhibits.'
                                ,textAlign: TextAlign.justify),
                          ),
                          Image.network('https://sc.santorini.tips/img/santorini-museums-archaeological-museum-840x480.jpg'),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                            'Museum of Folkloric Art'
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                'The Museum of Folkloric Art in Kontohóri, also set in the pumice cliff, hosts collections of lithographs, manuscripts and books, and it revives obsolete professions, such as those of blacksmiths, shoemakers and carpenters.'
                                ,textAlign: TextAlign.justify),
                          ),
                          Image.network('https://www.triphelp.gr/datafiles//Folklore%20Museum%20of%20Santorini.jpg'),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/path.png"),
                    ),
                    title: Text(
                      "Paths",
                      style: TextStyle(
                          fontSize: 22.0,
                          height: 1,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      ExpansionTile(
                        title: Text(
                          'Hiking path Megalochori-Pyrgos-Emporio',
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                'The path starts at the right side of the provincial road of Pyrgos, which goes up to Prophet Elias, just a few meters after the road that goes down to Emporeio.'
                                ,textAlign: TextAlign.justify),
                          ),
                          Image.network('https://villailias-wpengine.netdna-ssl.com/wp-content/uploads/2019/05/IMG_6666-1024x683.jpg'),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/church.png"),
                    ),
                    title: Text(
                      "Churches",
                      style: TextStyle(
                          fontSize: 22.0,
                          height: 1,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      ExpansionTile(
                        title: Text(
                          'Catholic Cathedral',
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                'The Catholic Cathedral is very close to the Orthodox Church. It is located in the Catholic quarter of Fira Santorini and distinguishes for its vibrant colors. The church is dedicated to Saint John the Baptist. The bell tower was rebuilt after the terrible earthquake of 1956 that hit the island.'
                                ,textAlign: TextAlign.justify),
                          ),
                          Image.network('https://www.greeka.com/seedo/photos/23/santorini-catholic-cathedral-thumb-1-640.jpg'),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/archeological.png"),
                    ),
                    title: Text(
                      "Archeological sites",
                      style: TextStyle(
                          fontSize: 22.0,
                          height: 1,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      ExpansionTile(
                        title: Text(
                          'The ancient city at Akrotiri',
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                'The ancient city at Akrotiri is not just the most important archaeological site on the island. But, thanks to its excellent state of preservation and the wealth of finds it has yielded, it is also the most important prehistoric settlement found anywhere in the Eastern Mediterranean. Akrotiri could be characterised as the prehistoric Pompeii of the Aegean.'
                                ,textAlign: TextAlign.justify),
                          ),
                          Image.network('https://www.santorini.net/wp-content/uploads/akrotiri_9406.jpg'),
                        ],
                      ),
                    ],
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
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SideBarLayout()),
                      );},
                    ),
                  ),
                  SlidingUpPanelWidget(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: ShapeDecoration(
                        color: Color(0xFFd5f2fd),
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
                          Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0,),
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
                ]
            )
        )
    );
  }
}