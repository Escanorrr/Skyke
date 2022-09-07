import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final PageController pageViewController = PageController(
    initialPage: 0,
  );
  Future<String> getName() async {
    DatabaseReference database = FirebaseDatabase(
            databaseURL:
                "https://skype-clone-c0624-default-rtdb.europe-west1.firebasedatabase.app")
        .ref();
    DatabaseReference riyadFirstName =
        database.child('/users/-NBOA_w8F3uw3WdjMs_5/firstName');
    DatabaseEvent firstevent = await riyadFirstName.once();

    DatabaseReference riyadSecondName =
        database.child('/users/-NBOA_w8F3uw3WdjMs_5/secondName');
    DatabaseEvent secondevent = await riyadSecondName.once();

// Print the data of the snapshot
    String fullName =
        await "${firstevent.snapshot.value.toString()} ${secondevent.snapshot.value.toString()}";
    return fullName;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
