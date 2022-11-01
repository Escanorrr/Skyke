
import 'package:flutter/cupertino.dart';

import '../../../models/conversation_model.dart';
import 'conversation_item_widget.dart';

class ConversationsListWidget extends StatefulWidget {
  const ConversationsListWidget({Key? key, this.conversationList}) : super(key: key);

  @required
  final List<ConversationModel>? conversationList;

  @override
  State<ConversationsListWidget> createState() => _ConversationsListWidgetState();
}

class _ConversationsListWidgetState extends State<ConversationsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        itemCount: widget.conversationList?.length,
        itemBuilder: (context, index) {
          return ConversationItemWidget(
            conversation: widget.conversationList![index],
          );
        },
      ),
    );
  }
}
