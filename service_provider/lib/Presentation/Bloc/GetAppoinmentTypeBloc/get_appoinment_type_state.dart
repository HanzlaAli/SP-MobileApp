part of 'get_appoinment_type_bloc.dart';

abstract class GetAppoinmentTypeStateBase {}

class GetAppoinmentTypeInitial extends GetAppoinmentTypeStateBase {}

class GetAppoinmentTypeLoading extends GetAppoinmentTypeStateBase {}

class GetAppoinmentTypeLoaded extends GetAppoinmentTypeStateBase {
  List<GetAppoinmentTypeModel>? model;
  GetAppoinmentTypeLoaded({this.model});
}

class GetAppoinmentTypeError extends GetAppoinmentTypeStateBase {}
