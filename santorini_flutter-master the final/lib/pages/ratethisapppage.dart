import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:santorini_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:share/share.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:santorini_flutter/sidebar/sidebar_layout.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class Ratethisapp extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santorini App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title: Text("     Rate this app"),
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
        body: Stack(
            children: <Widget>[
        Image.asset("images/santorini3.png",
            width: 450,
            height: 610,
            fit:BoxFit.fill),
              Container(
                margin: EdgeInsets.all(38),
                alignment: Alignment.centerLeft,
                width: 171,
                height: 68,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFfffff), Color(0xFFfffff)],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.topCenter,
                  ),
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () => _showFeedback(context),
                // this will trigger the feedback modal
                  padding: EdgeInsets.all(8.0),
                  textColor: Color(0xFF3b5188),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ImageIcon(
                        AssetImage('images/stars.png'),
                        size: 70.0,
                        color: Color(0xFF3b5188),
                      ),
                      Flexible(
                        child: Text('Rate this app', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF3b5188)),
                        ),)],),
                ),
              ),
            ]),
      ));
  }
}
  void _showFeedback(context) {
    showDialog(
      context: context,
      builder: (context) {
        return QuickFeedback(
          title: 'Leave a feedback', // Title of dialog
          showTextBox: true, // default false
          textBoxHint:
          'Share your feedback', // Feedback text field hint text default: Tell us more
          submitText: 'SUBMIT', // submit button text default: SUBMIT
          onSubmitCallback: (feedback) {
            print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
            Navigator.of(context).pop();
          },
          askLaterText: 'ASK LATER',
          onAskLaterCallback: () {
            print('Do something on ask later click');
          },
        );
      },
    );
  }
