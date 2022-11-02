import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinycolor2/tinycolor2.dart';


import '../controllers/chats_controller.dart';
import '../widgets/conversations_list_widget.dart';

class ChatsView extends GetView<ChatsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 40,
          child: TextField(
            style: TextStyle(
              fontSize: 18,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),

              prefixIcon: Icon(
                size: 30,
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                size: 30,
                Icons.filter_list,
                color: Colors.grey,
              ),
              //fillColor: Colors.red,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintText: 'Search',
            ),
          ),
        ),
      ),
      body:
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Obx(() {
                return ConversationsListWidget(
                    conversationList: controller.conversationsList.value);
              }),
              // Expanded(
              //   child: ListView.builder(
              //     padding: EdgeInsets.only(left: 10, right: 10),
              //     scrollDirection: Axis.vertical,
              //     shrinkWrap: true,
              //     itemCount: 25,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ListTile(
              //         contentPadding: EdgeInsets.only(top: 10,left: 7, right: 7),
              //         leading:
              //         Container(
              //           width: 50,
              //           height: 50,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Colors.blue.shade800,
              //           ),
              //           child:
              //
              //           Container(
              //               decoration: BoxDecoration(
              //                 shape: BoxShape.circle,),
              //               child: Image.asset('assets/images/logo.png' )),
              //           // Icon(
              //           //   Icons.person,
              //           //   size: 30,
              //           //   color: Colors.white,
              //           // ),
              //         ),
              //         title: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'John Doe',
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             Text(
              //               'Hello, this is a test message!get',
              //               style: TextStyle(
              //                 fontSize: 18,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ],
              //         ),
              //
              //         trailing: Text(
              //           '12:00',
              //           style: TextStyle(
              //             fontSize: 18,
              //             color: Colors.grey,
              //           ),
              //         ),
              //
              //
              //       );
              //     },
              //
              //     //
              //   ),
              // ),
            ],
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade700,
                border: Border.all(
                  color: Theme
                      .of(context)
                      .cardColor,
                  //width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 0), //(x,y)
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Icon(
                Icons.message_outlined,
                size: 30,
                color: Theme
                    .of(context)
                    .cardColor
                    .darken(13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
