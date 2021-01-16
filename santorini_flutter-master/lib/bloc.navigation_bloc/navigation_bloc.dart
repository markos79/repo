import 'package:bloc/bloc.dart';
import '../pages/myaccountspage.dart';
import '../pages/myorderspage.dart';

import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationBloc, NavigationStates> {
  NavigationStates get initialState => MyAccountsPage();

  Stream<NavigationStates> mapEventToStates(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
    }
  }

  @override
  Stream<NavigationStates> mapEventToState(Bloc<NavigationBloc, NavigationStates> event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
