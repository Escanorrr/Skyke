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
    var fullName = controller.getName();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
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
                Text(
                  '$fullName',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Share what you\'re up to',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
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
  }
}
