part of 'complaint_bloc.dart';

class ComplaintEvent {
  const ComplaintEvent();
}

class CreateComplaintEvent extends ComplaintEvent {
  final CreateComplaintModel model;

  CreateComplaintEvent({required this.model});
}

class GetComplaintEvent extends ComplaintEvent {
  GetComplaintEvent();
}
