import 'message_model.dart';


class ConversationModel {
  String? conversationId;
  List? chatters;
  MessageModel? lastMessage;
  ConversationInformation? conversationInformation;

  ConversationModel(this.conversationId, this.chatters, this.lastMessage);

  ConversationModel.fromJson(String conversationId, Map<String, dynamic> json) {
    this.conversationId = conversationId;
    this.chatters = json['chatters'];
    this.lastMessage = MessageModel.fromJson(json);
    this.conversationInformation = ConversationInformation.fromJson(json);
  }
}

class ConversationInformation {
  Map? chattersImages;
  Map? chattersNames;

  ConversationInformation(this.chattersImages, this.chattersNames);

  ConversationInformation.fromJson(Map<String, dynamic> json) {
    this.chattersImages = json['chattersImages'];
    this.chattersNames = json['chattersNames'];
  }
}
