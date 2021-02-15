import 'package:bloc/bloc.dart';
import 'package:santorini_flutter/pages/aboutthisapppage.dart';
import 'package:santorini_flutter/pages/contactuspage.dart';
import 'package:santorini_flutter/pages/followuspage.dart';
import 'package:santorini_flutter/pages/ratethisapppage.dart';
import 'package:santorini_flutter/pages/termsofusepage.dart';
import 'package:santorini_flutter/ui/volcaloes_map.dart';
import 'package:santorini_flutter/ui/churches_map.dart';
import '../pages/listpage.dart';
import 'package:santorini_flutter/ui/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  ListClickedEvent,
  AboutthisappClickedEvent,
  RatethisappClickedEvent,
  FollowusClickedEvent,
  TermsofuseClickedEvent,
  ContactusClickedEvent,
  MapClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  // TODO: implement initialState
  NavigationStates get initialState => MainMapScreen();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.MapClickedEvent:
        yield MainMapScreen();
        break;
      case NavigationEvents.ListClickedEvent:
        yield ListPage();
        break;
      case NavigationEvents.AboutthisappClickedEvent:
        yield Aboutthisapppage();
        break;
      case NavigationEvents.RatethisappClickedEvent:
        yield Ratethisapp();
        break;
      case NavigationEvents.FollowusClickedEvent:
        yield Followuspage();
        break;
      case NavigationEvents.TermsofuseClickedEvent:
        yield Termsofusepage();
        break;
      case NavigationEvents.ContactusClickedEvent:
        yield Contactusppage();
        break;
      case NavigationEvents.MapClickedEvent:
      // TODO: Handle this case.
        break;
    }
  }
}