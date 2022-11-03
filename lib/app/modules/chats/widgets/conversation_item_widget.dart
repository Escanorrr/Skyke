
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

import '../../../models/conversation_model.dart';
import '../../../models/message_model.dart';

import '../views/single _chat_screen.dart';
import 'conversation_user_avatar_widget.dart';

class ConversationItemWidget extends StatefulWidget {
  const ConversationItemWidget({
    Key? key,
    this.conversation,
  }) : super(key: key);

  @required
  final ConversationModel? conversation;

  @override
  State<ConversationItemWidget> createState() => _ConversationItemWidgetState();
}

class _ConversationItemWidgetState extends State<ConversationItemWidget> {
  String? lastMessageFormat(MessageModel message) {
    if (message.type == 'text') {
      return message.content;
    } else if (message.type == 'image') {
      return 'photo';
    } else if (message.type == 'file') {
      return Path.basename(message.content!);
    }

  }

  bool checkIfUnReadMessage(MessageModel message) {
    if (message != null) {
      if (message.senderID != 'user1') {
        if (message.seenTime == null) {
          return true;
        }
      }
    }
    return false;
  }

  bool checkIfMyMessageReaded(MessageModel message) {
    if (message != null) {
      if (message.senderID != 'user1') {
        if (message.seenTime == null) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                conversation: widget.conversation,
              ),
            ),
          ),

      child: Container(
       // height: SizeConfig.heightUnit * 12,
       // margin: EdgeInsets.only(bottom: SizeConfig.heightUnit * 1),
       // padding: EdgeInsets.all(SizeConfig.widthUnit * 2),
        child: Row(
          children: [
            ConversationUserAvatarWidget(
              imageLink: widget.conversation?.conversationInformation == null
                  ? null
              //make sure later whhich chatter is this user, so we can later get the other users (his contacts) images and not his
                  : widget.conversation?.conversationInformation?.chattersImages!['user2'],
            ),
            Flexible(
              child: Container(
                //padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightUnit),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Flexible(
                            child: Text(
                              '${widget.conversation?.conversationInformation == null ? null : widget.conversation?.conversationInformation?.chattersNames!['user2'] ?? widget.conversation?.conversationId}',
                              //style: AppTextStyle.darkGrey_15point5BOLD,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${widget.conversation?.lastMessage != null ? lastMessageFormat(widget.conversation!.lastMessage!) : '.......'}',
                            style: !checkIfUnReadMessage(widget.conversation!.lastMessage!)
                                ? TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  )
                                : TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          '${widget.conversation?.lastMessage != null ? widget.conversation?.lastMessage?.sendTime : ''}'),

                      // '${widget.conversation?.lastMessage != null ? dateTimeToTimeAgo(widget.conversation?.lastMessage?.sendTime) : ''}'),
                    ],
                  ),
                  Visibility(
                    visible: widget.conversation?.lastMessage == null
                        ? false
                        : widget.conversation?.lastMessage?.senderID == 'user1',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(child: checkIfMyMessageReaded(widget.conversation!.lastMessage!) ? Icon(Icons.message):Icon(Icons.message_outlined),),
                        // SvgPicture.asset(
                        //   checkIfMyMessageReaded(widget.conversation!.lastMessage!) ? AppAssets.seen : AppAssets.sent,
                        //   color: Colors.grey,
                        // ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.conversation?.lastMessage == null
                        ? false
                        : widget.conversation?.lastMessage?.senderID != 'user1' &&
                        checkIfUnReadMessage(widget.conversation!.lastMessage!),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // decoration: AppContainerStyle.circel.copyWith(
                          //   color: AppColors.primaryColor,
                          // ),
                          padding: EdgeInsets.all(7),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
