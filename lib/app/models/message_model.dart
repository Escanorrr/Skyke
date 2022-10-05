class MessageModel {
  String? id;
  String? content;
  String? type;
  String? senderID;
  DateTime? sendTime;
  DateTime? seenTime;

  MessageModel(this.id,this.content, this.type, this.senderID, this.sendTime, this.seenTime);

  MessageModel.fromJson(Map<String, dynamic> json) {
    content = json['id'] ?? json['last_message_id'];
    content = json['content'] ?? json['last_message_content'];
    type = json['type'] ?? json['last_message_type'];
    senderID = json['senderID'] ?? json['last_message_senderID'];
    sendTime = json['sent_time'] != null
        ? (json['sent_time']).toDate()
        : json['last_message_sent_time'] != null
            ? (json['last_message_sent_time']).toDate()
            : null;
    seenTime = json['seen_time'] != null
        ? (json['seen_time']).toDate()
        : json['last_message_seen_time'] != null
            ? (json['last_message_seen_time']).toDate()
            : null;
  }
}
