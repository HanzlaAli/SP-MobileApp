part of 'create_insurance_bloc.dart';

sealed class CreateInsuranceState {}

final class CreateInsuranceInitial extends CreateInsuranceState {}

final class CreateInsuranceLoading extends CreateInsuranceState {}

final class CreateInsuranceSuccess extends CreateInsuranceState {
  final SuccessModel model;

  CreateInsuranceSuccess({required this.model});
}

final class CreateInsuranceError extends CreateInsuranceState {
  final ErrorModel errorModel;

  CreateInsuranceError({required this.errorModel});
}
