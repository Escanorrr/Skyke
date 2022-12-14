import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../calls/views/calls_view.dart';
import '../../chats/views/chats_view.dart';
import '../../contacts/views/contacts_view.dart';
import '../../notifications/views/notifications_view.dart';
import '../controllers/home_controller.dart';

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
            onPressed: () {
              Get.toNamed('/sidebar');
              //Navigator.pushNamed(context, '/sidebar');
            },
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
          ChatsView(),
          CallsView(),
          ContactsView(),
          NotificationsView(),
        ],
        onPageChanged: (index) => controller.currentIndex(index),
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          margin: const EdgeInsets.only(top: 6.0),
          decoration: BoxDecoration(
            //elevation: 10,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                //offset: Offset(0, 1), //(x,y)
                blurRadius: 5,
                spreadRadius: 0.5,
              ),
            ],
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade400.withOpacity(0.7),
                width: 0.5,
                style: BorderStyle.values[1],
              ),
            ),
          ),
          height: 60,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting, // Fixed
            fixedColor: Colors.lightBlueAccent,
            //fixedColor: Colors.purple,
            currentIndex: controller.currentIndex.value,
            onTap: (index) => controller.changeIndex(index),
            items: [
              BottomNavigationBarItem(
                //backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.chat_rounded,
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
                  Icons.contacts_outlined,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.contacts_rounded,
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
