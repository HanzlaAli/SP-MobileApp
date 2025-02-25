part of 'withdraw_bloc.dart';

abstract class WithdrawEvent {}

class GetWithdraws extends WithdrawEvent {}

class SendWithdrawRequest extends WithdrawEvent {
  CreateWithdrawAccountRequestModel? createWithdrawAccountRequestModel;
  WithdrawRequestModel? model;
  SendWithdrawRequest({this.model, this.createWithdrawAccountRequestModel});
}
