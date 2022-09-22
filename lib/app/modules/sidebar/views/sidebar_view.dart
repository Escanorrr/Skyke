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

            ]
      ),
          )),
    );
  }
}
