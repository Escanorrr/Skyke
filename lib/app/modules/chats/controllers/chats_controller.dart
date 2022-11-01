import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/conversation_model.dart';
import '../../../models/message_model.dart';

class ChatsController extends GetxController {
  //TODO: Implement ChatsController
  StreamSubscription? chatsStream;


  final count = 0.obs;
  @override
  void onInit() {
    chatsStream = getConversationsList()
        .listen((event) {
      updateConversations(event);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    print('chats stream paused');
    if (chatsStream != null) {
      chatsStream?.cancel();
    }
    super.onClose();
  }

  void increment() => count.value++;

  //conversation vars and methods
  List<ConversationModel> _conversationsList = [];
  List<ConversationModel> get conversationsList {
    return _conversationsList;
  }

  void updateConversations(List<ConversationModel> newConversations) {
    _conversationsList = newConversations;
    //replace notifyListeners();
  }

  Stream<List<ConversationModel>> getConversationsList() {
    var collection = FirebaseFirestore.instance
        .collection('conversations')
        .where("chatters",arrayContains: 'user1');

    collection = collection.orderBy('last_message_sent_time', descending: true);

    return collection.snapshots().map((snapShot) {
      return snapShot.docs.map((document) {
        return ConversationModel.fromJson(document.id, document.data());
      }).toList();
    });
    // var stream = CombineLatestStream.list([
    //   collection.snapshots(),
    //   collection2.snapshots(),
    // ]);
    // return stream.map((event) {
    //   List<ConversationModel> convosFromBothSides = [];
    //   event[0].docs.forEach((document) {
    //     convosFromBothSides.add(ConversationModel.fromJson(document.id, document.data()));
    //   });
    //   event[1].docs.forEach((document) {
    //     convosFromBothSides.add(ConversationModel.fromJson(document.id, document.data()));
    //   });
    //   return convosFromBothSides;
    // });

  }

  //messages vars and methods
  List<MessageModel> _conversationsMessagesList = [];
  List<MessageModel> get conversationsMessagesList {
    return _conversationsMessagesList;
  }

  void updateConversationMessages(List<MessageModel> newMessages) {
    _conversationsMessagesList = newMessages;
    //replace notifyListeners();
  }

  Stream<List<MessageModel>> getConversationMessages(String conversationId) {
    Timestamp currentTime = Timestamp.fromDate(DateTime.now());
    return FirebaseFirestore.instance
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .orderBy('sent_time', descending: true)
        .snapshots()
        .map((snapShot) {
      return snapShot.docs.map((document) {
        if (document.data()['seen_time'] == null && document.data()['sent_by'] != 'user1') {
          document.reference.update(
            {
              'seen_time': currentTime,
            },
          );

          FirebaseFirestore.instance.collection('conversations').doc(conversationId).update({
            'last_message_seen_time': currentTime,
          });
        }

        return MessageModel.fromJson(document.data());
      }).toList();
    });
  }

   File? attachmentFile;
  TextEditingController messageTextController = TextEditingController();
  void changeAttachmentFile(File file) {
    attachmentFile = file;
    messageTextController.text = attachmentFile!.path.substring(attachmentFile!.path.length - 10);
    //replace notifyListeners();
  }

  void clearAttachment() {
    attachmentFile = null;
    messageTextController.text = '';
    //replace notifyListeners();
  }

  bool _waitingSendAttachment = false;
  bool get waitingSendAttachment {
    return _waitingSendAttachment;
  }

  void openFileLink(String fileLink) async {
    Uri _url = Uri.parse(fileLink);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> sendMessage(String conversationId, BuildContext context) async {
    Map<String, Object?> last_message_info = {};

    Timestamp currentTime = Timestamp.fromDate(DateTime.now());

    if (attachmentFile != null) {
      // if (p.extension(attachmentFile!.path) == '.png' || p.extension(attachmentFile!.path) == '.jpg') {
      //
      //   await sendAttachment(context, conversationId, currentTime, 'image', (url) {
      //     last_message_info.addAll({
      //       'last_message_type': 'image',
      //       'last_message_content': url,
      //     });
      //   });
      // } else {
      //   await sendAttachment(context, conversationId, currentTime, 'file', (url) {
      //     last_message_info.addAll({
      //       'last_message_type': 'file',
      //       'last_message_content': url,
      //     });
      //   });
      // }
    } else {
      if (messageTextController.text != '') {
        FirebaseFirestore.instance.collection('conversations').doc(conversationId).collection('messages').add({
          'content': messageTextController.text,
          'type': 'text',
          'send_by': 'patient',
          'send_time': currentTime,
          'seen_time': null,
        });

        last_message_info.addAll({
          'last_message_type': 'text',
          'last_message_content': messageTextController.text,
        });
      }
    }

    last_message_info.addAll({
      'last_message_send_time': currentTime,
      'last_message_send_by': 'patient',
      'last_message_seen_time': null,
    });
    FirebaseFirestore.instance.collection('conversations').doc(conversationId).update(last_message_info);
    //replace notifyListeners();
    clearAttachment();
  }
  // Future<void> sendAttachment(BuildContext context, String conversationId, Timestamp currentTime, String type, Function(String url) onSend) async {
  //   dio.FormData formData = dio.FormData.fromMap({
  //     "media": attachmentFile == null
  //         ? null
  //         : await dio.MultipartFile.fromFile(attachmentFile!.path, filename: "${attachmentFile!.path.split('/').last}"),
  //   });
  //
  //   if (!waitingSendAttachment) {
  //     _waitingSendAttachment = true;
  //     //replace notifyListeners();
  //
  //     try {
  //       ApiResponse response = await Api.post(SendAttachment, formData: formData);
  //       if (response.statusCode == 200) {
  //         print("send attachment::oooo::${response.statusCode}::${response.successFlag}");
  //         if (response.successFlag == true) {
  //           FirebaseFirestore.instance.collection('conversations').doc(conversationId).collection('messages').add({
  //             'content': '${response.body['url']}',
  //             'type': type,
  //             'send_by': 'patient',
  //             'send_time': currentTime,
  //             'seen_time': null,
  //           });
  //           onSend(response.body['url']);
  //         } else {
  //           showToast(context, response.message);
  //         }
  //       } else {
  //         print("addToCart::oooo::ERROR::${response.error})");
  //         showToast(context, response.message);
  //       }
  //     } catch (error) {
  //       print("addToCart::oooo::ERROR::${error.toString()})");
  //       showToast(context, AppConstants.ApiResponseMessages[2]);
  //     } finally {
  //       _waitingSendAttachment = false;
  //       notifyListeners();
  //     }
  //   }
  // }





}
