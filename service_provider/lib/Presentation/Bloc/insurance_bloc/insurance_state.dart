part of 'insurance_bloc.dart';

sealed class InsuranceState {}

final class InsuranceInitial extends InsuranceState {}

final class InsuranceLoading extends InsuranceState {}

final class InsuranceLoaded extends InsuranceState {
  final InsuranceModel model;

  InsuranceLoaded({required this.model});
}

final class InsuranceSuccess extends InsuranceState {
  final SuccessModel model;

  InsuranceSuccess({required this.model});
}

final class InsuranceError extends InsuranceState {
  final ErrorModel errorModel;

  InsuranceError({required this.errorModel});
}
