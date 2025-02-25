part of 'auth_bloc.dart';

abstract class AuthStateBase {}

class AuthInitialState extends AuthStateBase {}

class AuthLoadingState extends AuthStateBase {}

class AuthenticatedState extends AuthStateBase {}

class NotAuthenticatedState extends AuthStateBase {}
