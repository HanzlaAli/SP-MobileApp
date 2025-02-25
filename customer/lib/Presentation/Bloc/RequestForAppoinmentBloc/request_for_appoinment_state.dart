part of 'request_for_appoinment_bloc.dart';

abstract class RequestForAppoinmentStateBase {}

class RequestForAppoinmentInitial extends RequestForAppoinmentStateBase {}

class RequestForAppoinmentLoading extends RequestForAppoinmentStateBase {}

class RequestForAppoinmentSuccess extends RequestForAppoinmentStateBase {}

class RequestForAppoinmentError extends RequestForAppoinmentStateBase {}
