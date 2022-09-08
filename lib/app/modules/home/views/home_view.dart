import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:animator/animator.dart';

import '../widgets/Calls.dart';
import '../widgets/Chats.dart';
import '../widgets/Contacts.dart';
import '../widgets/Notifications.dart';

class HomeView extends GetView<HomeController> {
  // final String title;
  // final String message;
  //
  // HomeView(this.title, this.message);
  @override
  Widget build(BuildContext context) {
    //String fullName = controller.getName();
    return FutureBuilder(
        future: controller.getName(),
        builder: (context, snapshot) {
          String fullName = snapshot.data.toString();
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.blue.shade800,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
                leadingWidth: 50,
                title: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return Text(
                          controller.fullname.value,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      Text(
                        'Share what you\'re up to',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    padding: EdgeInsets.only(right: 10),
                    icon: Icon(
                      Icons.videocam_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 42,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            body: PageView(
              controller: controller.pageViewController,
              children: [
                Chats(),
                Calls(),
                Contacts(),
                Notifications(),
              ],
            ),
          );
        });
  }
}
