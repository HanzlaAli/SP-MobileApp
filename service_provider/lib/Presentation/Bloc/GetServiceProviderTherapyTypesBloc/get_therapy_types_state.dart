part of 'get_therapy_types_bloc.dart';

abstract class GetTherapyTypesBase {
  const GetTherapyTypesBase();
}

class GetTherapyTypesInitial extends GetTherapyTypesBase {}

class GetTherapyTypesLoading extends GetTherapyTypesBase {}

class GetTherapyTypesLoaded extends GetTherapyTypesBase {
  List<GetTherapyTypeModel> getTherapyTypeModel;
  GetTherapyTypesLoaded({required this.getTherapyTypeModel});
}

class GetTherapyTypesError extends GetTherapyTypesBase {
  ErrorModel? errorModel;
  GetTherapyTypesError({this.errorModel});
}
