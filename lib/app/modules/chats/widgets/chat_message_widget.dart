
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/message_model.dart';
import '../controllers/chats_controller.dart';

class ChatMessageWidget extends StatefulWidget {
  const ChatMessageWidget({
    Key? key,
    this.message,
    this.away,
    this.otherUserId,
  }) : super(key: key);

  @required
  final MessageModel? message;
  @required
  final bool? away;
  final String? otherUserId;

  @override
  State<ChatMessageWidget> createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  bool showTime = false;
  var controller = Get.find<ChatsController>();
  Alignment myAlignment() {
    //return "lang".tr() != 'ar' ? Alignment.bottomLeft : Alignment.bottomRight;
    return Alignment.bottomRight;
  }

  Alignment otherUserAlignment() {
    //return "lang".tr() != 'ar' ? Alignment.bottomRight : Alignment.bottomLeft;
    return Alignment.bottomLeft;
  }

  @override
  Widget build(BuildContext context) {
    //print('other user ID: ${widget.otherUserId} message sender ID: ${widget.message!.senderID}');


    return Column(
      children: [
        Column(
          crossAxisAlignment: widget.message!.senderID != 'user1' ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Bubble(
              padding: widget.message!.senderID == 'system' ? BubbleEdges.all(0) : null,
              margin: BubbleEdges.only(top: 10),
              alignment: widget.message!.senderID == 'system'
                  ? Alignment.center
                  : widget.message!.senderID !='user1'
                      ? otherUserAlignment()
                      : myAlignment(),
              nip: BubbleNip.no,
              color: widget.message!.senderID == 'system'
                  ? Colors.white
                  : widget.message!.senderID == 'user1'
                      ? Theme.of(context).primaryColor
                      : Colors.lightBlue,
              elevation: 0,
              child: messageFromType(widget.message!.type!, context),
            ),
            Visibility(
              visible: showTime,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  //'${DateFormat('yyyy-MM-dd – kk:mm').format(widget.message!.sendTime)}',
                  "${widget.message!.sendTime}",
                 // style: AppTextStyle.grey_13,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    //fontSize: 13,
                  ),

                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: widget.away!,
          child: Bubble(
            margin: BubbleEdges.only(top: 10),
            alignment: Alignment.center,
            nip: BubbleNip.no,
            color: Colors.grey.shade400,
            elevation: 0,
            child: Text(
              //'${DateFormat('yyyy-MM-dd – kk:mm').format(widget.message.sendTime)}',
              "${widget.message!.sendTime}",
              style: TextStyle(
                color: Colors.grey.shade500,
                //fontSize: 13,
              ),
              //style: AppTextStyle.grey_13,
            ),
          ),
        ),
      ],
    );
  }

  Widget messageFromType(String messageType, BuildContext context) {
    if (messageType == 'text') {
      return GestureDetector(
        onTap: () {
          setState(() {
            showTime = !showTime;
          });
        },
        child: Container(
          //width: SizeConfig.widthUnit * 60,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.message!.senderID != widget.otherUserId
                    ? Row(
                        children: [
                          // SvgPicture.asset(
                          //   widget.message?.seenTime == null ?
                          //   AppAssets.sent : AppAssets.seen,
                          //   color: AppColors.white,
                          // ),
                          Icon(widget.message?.seenTime == null ?
                            Icons.done:Icons.done_all,
                            color: Colors.grey,
                           // size: 12,
                          ),
                          SizedBox(width: 8),
                        ],
                      )
                    : Container(),
                Flexible(
                  child: Text(
                    '${widget.message!.content}',
                    style: widget.message!.senderID != widget.otherUserId ?
                   // AppTextStyle.white_14 : AppTextStyle.black_14,
                    TextStyle(
                      color: Colors.white,
                      //fontSize: 14,
                    ) : TextStyle(
                      color: Colors.black,
                      //fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    // else if (messageType == 'image') {
    //   return Container(
    //     child: Padding(
    //       padding: EdgeInsets.all(2.0),
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           widget.message!.senderID != widget.otherUserId
    //               ? Row(
    //                   children: [
    //                     SvgPicture.asset(
    //                       widget.message!.seenTime == null ? AppAssets.sent : AppAssets.seen,
    //                       color: AppColors.white,
    //                     ),
    //                     SizedBox(width: 8),
    //                   ],
    //                 )
    //               : Container(),
    //           Container(
    //             width: SizeConfig.widthUnit * 60,
    //             height: SizeConfig.widthUnit * 40,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(10),
    //               child: ImagePlaceHolder(
    //                 holder: AppAssets.placeholder_image,
    //                 img: widget.message!.content,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    //    else if (messageType == 'file') {
    //   return GestureDetector(
    //     onTap: () => Provider.of<MessagesController>(context, listen: false).openFileLink(widget.message.content),
    //     child: Container(
    //       child: Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             widget.message.sendBy == 'patient'
    //                 ? Row(
    //                     children: [
    //                       SvgPicture.asset(
    //                         widget.message.seenTime == null ? AppAssets.sent : AppAssets.seen,
    //                         color: AppColors.white,
    //                       ),
    //                       SizedBox(width: 8),
    //                     ],
    //                   )
    //                 : Container(),
    //             Flexible(
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Flexible(
    //                     child: Text(
    //                       '${basename(widget.message.content)}',
    //                       style: widget.message.sendBy == 'patient' ? AppTextStyle.white_14 : AppTextStyle.black_14,
    //                     ),
    //                   ),
    //                   SizedBox(width: SizeConfig.widthUnit * 2),
    //                   SvgPicture.asset(
    //                     AppAssets.file,
    //                     color: widget.message.sendBy == 'doctor' ? AppColors.black : AppColors.white,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
       else if (messageType == 'title') {
      return Container(
        // decoration: AppContainerStyle.radiusAll8.copyWith(
        //   border: Border.all(color: AppColors.grey, width: 2),
        // ),
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Center(
              child: Text(
                'textConsultation',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height:12),
            Center(
              child: Text(
                // 'consultationDate:'.tr() + ' ${DateFormat('yyyy-MM-dd – kk:mm').format(widget.message.sendTime)} ',
                // style: AppTextStyle.black_14,

                'consultationDate:' + ' ${widget.message!.sendTime} ',
                style: TextStyle(
                  color: Colors.black,
                  //fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }
       else return Text("nothing");
  }
}
