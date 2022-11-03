import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/conversation_model.dart';
import '../controllers/chats_controller.dart';
import '../widgets/chat_messages_list_widget.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, this.conversation}) : super(key: key);

  @required
  final ConversationModel? conversation;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

StreamSubscription? chatMessagesStream;

class _ChatScreenState extends State<ChatScreen> {
  var controller = Get.find<ChatsController>();


  @override
  initState() {
    chatMessagesStream =
        controller.getConversationMessages(widget.conversation!.conversationId!)
            .listen((event) {
          controller.updateConversationMessages(event);
        });
  }

  dispose() {
    print('chat messages stream paused');
    if (chatMessagesStream != null) {
      chatMessagesStream!.cancel();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    print("this is the other user id from the conversation: ${controller.getOtherUserId(
        widget.conversation?.chatters)}");
    return SafeArea(
      child: Container(
        // height: SizeConfig.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        foregroundImage: Image
                            .asset(
                          'assets/images/Riyad.png',
                          fit: BoxFit.cover,
                        ).image,

                        child: widget.conversation?.conversationInformation ==
                            null
                            ? null
                            :Image.asset("assets/images/Riyad.png",fit: BoxFit.cover,)
                            // : widget.conversation!.conversationInformation!
                            // .chattersImages![controller.getOtherUserId(widget
                            // .conversation?.chatters)
                            // ],
                      ),
                    ),
                    //height: SizeConfig.widthUnit * 15,
                    //width: SizeConfig.widthUnit * 15,
                  ),
                  SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(
                      widget.conversation?.conversationInformation == null
                          ? null
                          : widget.conversation?.conversationInformation
                          ?.chattersNames?[controller.getOtherUserId(
                          widget.conversation?.chatters)] ??
                          widget.conversation!.conversationId,
                      //style: AppTextStyle.black_16BOLD,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        //"lang".tr() == 'ar' ? Icons.arrow_back_ios_new : Icons.arrow_forward_ios,
                        size: 25,
                        color: Colors.grey,
                      )),
                  //Spacer(),
                ],
              ),
            ),

            Obx(() {
              return ChatMessagesListWidget(
                messagesList: controller.conversationsMessagesList.value,
                otherUserId: controller.getOtherUserId(
                    widget.conversation!.chatters),
              );
            }),

            // Container(
            //   //height: SizeConfig.heightUnit * 10,
            //   margin: EdgeInsets.symmetric(
            //     horizontal: 15,
            //     vertical: 15,
            //   ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Flexible(
            //             child: TextFieldWidget(
            //               readOnly: snapShoot.attachmentFile != null,
            //               controller: snapShoot.messageTextController,
            //               width: double.infinity,
            //               hint: 'أكتب الرسالة هنا....',
            //               textInputType: TextInputType.multiline,
            //               prefixIcon: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   GestureDetector(
            //                     onTap: () =>
            //                         snapShoot.sendMessage(
            //                             widget.conversation.conversationId,
            //                             context),
            //                     child: Container(
            //                       child: !snapShoot.waitingSendAttachment
            //                           ? Center(
            //                         child: SvgPicture.asset(
            //                           "lang".tr() == 'ar'
            //                               ? AppAssets.send
            //                               : AppAssets.send_en,
            //                           color: AppColors.primaryColor,
            //                         ),
            //                       )
            //                           : Center(
            //                         child: LoadingAnimationWidget
            //                             .fourRotatingDots(
            //                             color: AppColors.primaryColor,
            //                             size: 20),
            //                       ),
            //                       padding: EdgeInsets.all(
            //                           SizeConfig.widthUnit * 4),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               suffixIcon: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   if (snapShoot.attachmentFile == null)
            //                     ImageInput(
            //                       pickPDF: true,
            //                       imageFile: snapShoot.attachmentFile,
            //                       saveImage: snapShoot.changeAttachmentFile,
            //                       child: Container(
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(4.0),
            //                           child: Column(
            //                             mainAxisAlignment: MainAxisAlignment
            //                                 .center,
            //                             children: [
            //                               Container(
            //                                 child: Center(
            //                                   child: SvgPicture.asset(
            //                                     AppAssets.attechment,
            //                                     color: AppColors.primaryColor,
            //                                   ),
            //                                 ),
            //                                 padding: EdgeInsets.all(
            //                                     SizeConfig.widthUnit * 4),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   if (snapShoot.attachmentFile != null)
            //                     GestureDetector(
            //                       onTap: () => snapShoot.clearAttachment(),
            //                       child: Container(
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(4.0),
            //                           child: Column(
            //                             mainAxisAlignment: MainAxisAlignment
            //                                 .center,
            //                             children: [
            //                               Container(
            //                                 child: Center(
            //                                     child: Icon(
            //                                       Icons.close,
            //                                       color: AppColors.red,
            //                                     )),
            //                                 padding: EdgeInsets.all(
            //                                     SizeConfig.widthUnit * 4),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
