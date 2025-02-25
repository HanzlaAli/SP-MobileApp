part of 'active_not_active_user_bloc.dart';

abstract class ActiveNotActiveUserEvent {}

class UserActive extends ActiveNotActiveUserEvent {}

class UserNonActive extends ActiveNotActiveUserEvent {}
