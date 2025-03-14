part of 'complaint_bloc.dart';

class ComplaintState {
  const ComplaintState();
}

final class ComplaintInitial extends ComplaintState {}

final class ComplaintLoading extends ComplaintState {}

final class ComplaintSuccess extends ComplaintState {
  SuccessModel model;
  ComplaintSuccess({required this.model});
}

final class ComplaintLoaded extends ComplaintState {
  List<ComplaintModel> model;
  ComplaintLoaded({required this.model});
}

final class ComplaintError extends ComplaintState {
  ErrorModel errorModel;
  ComplaintError({required this.errorModel});
}
