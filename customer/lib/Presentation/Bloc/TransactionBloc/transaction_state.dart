part of 'transaction_bloc.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  List<GetTransactionHistoryModel>? model;
  TransactionLoaded({this.model});
}

class TransactionError extends TransactionState {}
