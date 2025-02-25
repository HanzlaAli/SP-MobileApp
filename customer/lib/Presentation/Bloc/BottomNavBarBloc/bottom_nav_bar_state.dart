part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarState {
  const BottomNavBarState();
}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavBarLoading extends BottomNavBarState {}

class BottomNavBarLoaded extends BottomNavBarState {
  Widget? widget;
  BottomNavBarLoaded({this.widget});
}

class BottomNavBarError extends BottomNavBarState {}
