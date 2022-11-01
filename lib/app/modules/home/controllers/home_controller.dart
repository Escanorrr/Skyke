import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../calls/controllers/calls_controller.dart';
import '../../chats/controllers/chats_controller.dart';
import '../../contacts/controllers/contacts_controller.dart';
import '../../notifications/controllers/notifications_controller.dart';

class HomeController extends GetxController {
  var fullname = ''.obs;
  var currentIndex = 0.obs;
  final PageController pageViewController = PageController(
    initialPage: 0,
  );

  Future<String> getName() async {
    String firstName = '';
    String lastName = '';
    await FirebaseFirestore.instance.collection('users').doc("user1").get().then((value) {
      print(value.data());
      firstName = value.data()!['firstName'];
      lastName = value.data()!['lastName'];
      print("just loaded the full name for $firstName ");

    });
    return "$firstName $lastName";

  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    Get.put(ChatsController());
    Get.put(CallsController());
    Get.put(ContactsController());
    Get.put(NotificationsController());
    fullname.value = await getName();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    pageViewController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    print("index: $index");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
