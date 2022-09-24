import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../controllers/sidebar_controller.dart';

class SidebarView extends GetView<SidebarController> {
  const SidebarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SafeArea(
          child:
          Scaffold(
            body: Column(
            children: <Widget>[
              Container(
                padding:EdgeInsets.only(top: 10,bottom: 10,left:10,right:30),
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade500,
                      width: 0.3,
                    ),
                  ),
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).cardColor.darken(13),
                          size: 30,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //signout
                      },
                      child: Text(
                        'Sign out',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),

                  ],

                ),
              ),
              Container(
               //height: 100,
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //create a round blue container
                  Container(
                    //padding: EdgeInsets.only(top: 20,left: 20),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade100,
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                    ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Riyad Djedda",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('YourEmail@gmail.com',
                          style: TextStyle(
                          fontSize: 14,
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Text('My Microsoft account',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),),
                      ],
                    ),
                  ),
                ],

                ),
              ),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade500,
                            width: 0.3,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.circle,
                          color: Colors.green.shade800,
                          size: 19,
                        ),
                        title: Text(
                          'Active',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onTap: () {
                          //Get.toNamed('/profile');
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade500,
                            width: 0.3,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.volume_down_alt,
                          color: Colors.grey,
                          size: 19,
                        ),
                        title: Text(
                          'Share what you\'re up to',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onTap: () {
                          //Get.toNamed('/settings');
                        },
                      ),
                    ),
                    //create a bookmarks list tile
                    ListTile(
                      leading: Icon(
                        Icons.bookmark_border,
                        color: Colors.grey,
                        size: 20,
                      ),
                      title: Text(
                        'Bookmarks',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        //Get.toNamed('/bookmarks');
                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.grey.shade500,
                    ),
                    //create an invite people list tile
                    ListTile(
                      leading: Icon(
                        Icons.people_alt_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      title: Text(
                        'Invite people',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        //Get.toNamed('/invite');
                      },
                    ),
                  ],

                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height:40,
                width: double.infinity,
                padding: EdgeInsets.only(left: 30),
                color: Theme.of(context).cardColor.darken(13),
                child: Text(
                  'MANAGE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade500,
                            width: 0.3,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: 19,
                        ),
                        title: Text(
                          'Skype profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          //Get.toNamed('/profile');
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade500,
                            width: 0.3,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.attach_money_outlined,
                          color: Colors.grey,
                          size: 19,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skype to Phone',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Call phones at affordable rates',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          //Get.toNamed('/settings');
                        },
                      ),
                    ),
                    //create a bookmarks list tile
                    ListTile(
                      leading: Icon(
                        Icons.perm_phone_msg_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Skype Number',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Get a second number',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        //Get.toNamed('/bookmarks');
                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.grey.shade500,
                    ),
                    //create a settings list tile
                    ListTile(
                      leading: Icon(
                        Icons.settings_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        //Get.toNamed('/settings');
                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.grey.shade500,
                    ),
                    //create a what's new list tile
                    ListTile(
                      leading: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.grey,
                        size: 20,
                      ),
                      title: Text(
                        'What\'s new',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        //Get.toNamed('/whatsnew');
                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.grey.shade500,
                    ),
                  ],


                ),
              ),

            ]
      ),
          )),
    );
  }
}
