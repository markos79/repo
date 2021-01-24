
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_resolution.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/src/material/circle_avatar.dart';
import 'package:flutter/src/widgets/image.dart';

class MyOrdersPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              'List'
          ),
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
                  "Volcanos",
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
                  backgroundImage: AssetImage("images/paths.png"),
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
                    backgroundImage: AssetImage("images/churches.png"),
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
                )
             ]
               )
              )
           );
  }
}