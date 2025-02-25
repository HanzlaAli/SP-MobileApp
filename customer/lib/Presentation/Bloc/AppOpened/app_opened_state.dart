part of 'app_opened_bloc.dart';

abstract class AppOpenedStateBase {}

class AppOpenedInitialState extends AppOpenedStateBase {}

class AppOpenedLoadingState extends AppOpenedStateBase {}

class AppOpenedState extends AppOpenedStateBase {
  bool? isAppOpened;
  AppOpenedState({this.isAppOpened});
}

class AppNotOpenedState extends AppOpenedStateBase {}
