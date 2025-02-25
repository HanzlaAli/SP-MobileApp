part of 'qualification_bloc.dart';

abstract class QualificationEvent {}

class AddQualification extends QualificationEvent {
  CreateQualificationModel? model;
  AddQualification({this.model});
}

class UpdateQualification extends QualificationEvent {
  UpdateQualificationModel? model;
  UpdateQualification({this.model});
}
