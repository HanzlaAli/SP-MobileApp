part of 'insurance_bloc.dart';

sealed class InsuranceEvent {
  const InsuranceEvent();
}

class GetInsurance extends InsuranceEvent {}

class CreateInsurance extends InsuranceEvent {
  CreateInsuranceModel model;
  CreateInsurance({required this.model});
}

class UpdateInsurance extends InsuranceEvent {
  UpdateInsuranceModel model;
  UpdateInsurance({required this.model});
}
