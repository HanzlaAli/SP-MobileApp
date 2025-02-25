part of 'DeleteAccount_bloc.dart';

abstract class DeleteAccountStateBase {}

class DeleteAccountInitialState extends DeleteAccountStateBase {}

class DeleteAccountLoadingState extends DeleteAccountStateBase {}

class DeleteAccountSuccessState extends DeleteAccountStateBase {}

class NotDeleteAccountenticatedState extends DeleteAccountStateBase {}
