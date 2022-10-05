import 'message_model.dart';


class ConversationModel {
  String? conversationId;
  int? doctorId;
  int? patientId;
  MessageModel? lastMessage;
  ConversationInformation? conversationInformation;

  ConversationModel(this.conversationId, this.doctorId, this.patientId, this.lastMessage);

  ConversationModel.fromJson(String conversationId, Map<String, dynamic> json) {
    this.conversationId = conversationId;
    this.doctorId = json['chatter1ID'];
    this.patientId = json['chatter2ID'];
    this.lastMessage = MessageModel.fromJson(json);
    this.conversationInformation = ConversationInformation.fromJson(json);
  }
}

class ConversationInformation {
  String? chatter1Image;
  String? chatter2Image;
  String? chatter1Name;
  String? chatter2Name;

  ConversationInformation(this.chatter1Name, this.chatter1Image, this.chatter2Name, this.chatter2Image);

  ConversationInformation.fromJson(Map<String, dynamic> json) {
    this.chatter1Name = json['chatter1Name'];
    this.chatter1Image = json['chatter1Image'];
    this.chatter2Name = json['chatter2Name'];
    this.chatter2Image = json['chatter2Image'];
  }
}
