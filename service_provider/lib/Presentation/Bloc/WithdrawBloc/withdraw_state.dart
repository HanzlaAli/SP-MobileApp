part of 'withdraw_bloc.dart';

abstract class WithdrawState {}

class WithdrawInitial extends WithdrawState {}

class WithdrawLoading extends WithdrawState {}

class WithdrawLoaded extends WithdrawState {
  List<WithdrawHistoryModel>? model;
  WithdrawLoaded({this.model});
}

class WithdrawSuccess extends WithdrawState {}

class WithdrawError extends WithdrawState {}
