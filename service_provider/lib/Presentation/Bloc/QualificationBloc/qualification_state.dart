part of 'qualification_bloc.dart';

abstract class QualificationState {}

class QualificationInitial extends QualificationState {}

class QualificationLoading extends QualificationState {}

class QualificationLoaded extends QualificationState {}

class QualificationError extends QualificationState {}
