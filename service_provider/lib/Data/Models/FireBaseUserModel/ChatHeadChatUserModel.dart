class ChatHeadChatUserModel {
  String? messageSnapShotId;
  int? uId;
  int? reciverId;
  String? userName;
  String? lastActive;
  bool? isActive;
  String? imageUrl;
  int? messageUId;
  String? lastMessage;
  String? lastMessageTime;
  bool? isRead;
  int? timeSpam;
  DateTime? appointmentStartTime;

  ChatHeadChatUserModel(
      {this.uId,
      this.messageUId,
      this.appointmentStartTime,
      this.messageSnapShotId,
      this.isActive,
      this.lastActive,
      this.userName,
      this.imageUrl,
      this.timeSpam,
      this.isRead,
      this.lastMessage,
      this.lastMessageTime,
      this.reciverId});
}
