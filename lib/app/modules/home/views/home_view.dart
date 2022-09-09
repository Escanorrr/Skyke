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
        onPageChanged: (index) => controller.currentIndex(index),
      ),
      bottomNavigationBar: Obx(() {
        return SizedBox(
          height: 60,
          child: BottomNavigationBar(
            elevation: 10,

            type: BottomNavigationBarType.shifting, // Fixed
            fixedColor: Colors.lightBlueAccent,

            //fixedColor: Colors.purple,
            currentIndex: controller.currentIndex.value,
            onTap: (index) => controller.changeIndex(index),
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.chat_bubble,
                  color: Colors.lightBlueAccent,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.call_outlined,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.call,
                  color: Colors.lightBlueAccent,
                ),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.lightBlueAccent,
                ),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.notifications,
                  color: Colors.lightBlueAccent,
                ),
                label: 'Notifications',
              ),
            ],
          ),
        );
      }),
    );
  }
}
