part of 'create_appoinment_bloc.dart';

abstract class CreateAppoinmentStateBase {}

class CreateAppoinmentInitial extends CreateAppoinmentStateBase {}

class CreateAppoinmentLoading extends CreateAppoinmentStateBase {}

class CreateAppoinmentSuccess extends CreateAppoinmentStateBase {}

class CreateAppoinmentError extends CreateAppoinmentStateBase {}
