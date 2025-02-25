part of 'services_bloc.dart';

abstract class ServicesStateBase {
  const ServicesStateBase();
}

class ServicesInitial extends ServicesStateBase {}

class ServicesBlocLoading extends ServicesStateBase {
  bool isSuccess;
  ServicesBlocLoading({required this.isSuccess});
}

class ServicesLoaded extends ServicesStateBase {
  SuccessModel? successModel;
  List<GetServicesModel>? list;
  ServicesLoaded({this.list, this.successModel});
}

class ServicesError extends ServicesStateBase {
  ErrorModel? errorModel;
  bool isSuccess;
  ServicesError({this.errorModel, required this.isSuccess});
}
