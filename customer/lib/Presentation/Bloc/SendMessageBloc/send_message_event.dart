part of 'send_message_bloc.dart';

abstract class SendMessageEvent {}

class SendMessage extends SendMessageEvent {
  ChatModel? model;
  SendMessage({this.model});
}
