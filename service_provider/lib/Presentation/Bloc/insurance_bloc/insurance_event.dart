part of 'insurance_bloc.dart';

sealed class InsuranceEvent {
  const InsuranceEvent();
}

class GetInsurance extends InsuranceEvent {}
