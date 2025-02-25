part of 'therapy_type_bloc.dart';

abstract class TherapyTypeStateBase {}

class TherapyTypeInitialState extends TherapyTypeStateBase {}

class TherapyTypeLoadingState extends TherapyTypeStateBase {}

class TherapyTypeLoadedState extends TherapyTypeStateBase {
  List<TherapyTypeResponseModel>? model;
  TherapyTypeLoadedState({this.model});
}

class TherapyTypeErrorState extends TherapyTypeStateBase {}
