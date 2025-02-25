part of 'request_for_appoinment_bloc.dart';

abstract class RequestForAppoinmentEventBase {}

class RequestForAppoinment extends RequestForAppoinmentEventBase {
  CustomerAppoinmentRequestModel? model;
  RequestForAppoinment({this.model});
}
