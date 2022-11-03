
import 'package:flutter/cupertino.dart';

import '../../../models/message_model.dart';
import 'chat_message_widget.dart';

class ChatMessagesListWidget extends StatelessWidget {
  const ChatMessagesListWidget({Key? key, this.messagesList,this.otherUserId}) : super(key: key);

  @required
  final List<MessageModel>? messagesList;
  final String? otherUserId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messagesList!.length,
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        itemBuilder: (context, index) {
          if (index > 0) {
            print(messagesList![index].sendTime!.difference(messagesList![index - 1].sendTime!).inDays);
            return ChatMessageWidget(
              away: messagesList![index].sendTime!.difference(messagesList![index - 1].sendTime!).inDays != 0,
              message: messagesList![index],
              otherUserId: otherUserId,
            );
          }
          return ChatMessageWidget(
            away: false,
            message: messagesList![index],
          );
        },
      ),
    );
  }
}
