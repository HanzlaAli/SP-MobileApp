part of 'create_appoinment_bloc.dart';

abstract class CreateAppoinmentEventBase {}

class CreateAppoinment extends CreateAppoinmentEventBase {
  CreateAppoinmentModel? model;
//  CreateChatHeadModel? chatHeadModel;
  CreateAppoinment({
    this.model,
    //required this.chatHeadModel
  });
}
