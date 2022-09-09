import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var fullname = ''.obs;
  var currentIndex = 0.obs;
  final PageController pageViewController = PageController(
    initialPage: 0,
  );

  Future<String> getName() async {
    DatabaseReference database = FirebaseDatabase(
            databaseURL:
                "https://skype-clone-c0624-default-rtdb.europe-west1.firebasedatabase.app")
        .ref();
    DatabaseReference riyadName = database.child('/users/-NBOA_w8F3uw3WdjMs_5');
    DatabaseEvent event = await riyadName.once();

    String firstName = event.snapshot.child("firstName").value.toString();
    String lastName = event.snapshot.child("lastName").value.toString();

    return "$firstName $lastName";
  }

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
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
