part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarEventBase {
  const BottomNavBarEventBase();
}

class ChangeScreen extends BottomNavBarEventBase {
  int index;
  ChangeScreen({this.index = 0});
}
