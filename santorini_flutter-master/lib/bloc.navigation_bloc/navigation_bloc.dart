import 'package:bloc/bloc.dart';
import 'package:santorini_flutter/pages/exitpage.dart';
import 'package:santorini_flutter/pages/followuspage.dart';
import 'package:santorini_flutter/pages/ratepage.dart';
import 'package:santorini_flutter/pages/mappage.dart';
import 'package:santorini_flutter/pages/poispage.dart';
import 'package:santorini_flutter/pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MapPageClickEvent,
  PoisPageClickedEvent,
  RatePageClickedEvent,
  FollowusPageClickedEvent,
  ExitPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationBloc, NavigationStates> {
  NavigationStates get initialState => MapPage();

  Stream<NavigationStates> mapEventToStates(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MapPageClickEvent:
        yield MapPage();
        break;
      case NavigationEvents.PoisPageClickedEvent:
        yield PoisPage();
        break;
      case NavigationEvents.RatePageClickedEvent:
        yield RatePage();
        break;
      case NavigationEvents.FollowusPageClickedEvent:
        yield FollowusPage();
        break;
      case NavigationEvents.ExitPageClickedEvent:
        yield ExitPage();
        break;
    }
  }

  @override
  Stream<NavigationStates> mapEventToState(Bloc<NavigationBloc, NavigationStates> event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}

