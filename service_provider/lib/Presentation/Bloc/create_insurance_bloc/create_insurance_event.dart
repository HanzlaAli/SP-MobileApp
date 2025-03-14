part of 'create_insurance_bloc.dart';

sealed class CreateInsuranceEvent {}

class CreateInsurance extends CreateInsuranceEvent {
  final CreateInsuranceModel model;

  CreateInsurance({required this.model});
}
