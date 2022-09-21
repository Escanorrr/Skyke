import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../controllers/calls_controller.dart';

class CallsView extends GetView<CallsController> {
  const CallsView({Key? key}) : super(key: key);
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
          children: [
            Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'People',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Expanded(
                child: ListView.builder(

                  padding: EdgeInsets.only(left: 5, right: 5),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 76,
                      child: ListTile(
                        //contentPadding: EdgeInsets.only(top: 10,left: 7, right: 7),
                        leading:
                        Container(

                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade800,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 55,
                            color: Colors.white,
                          ),
                        ),
                        title:
                        Text(
                          '+1 123 456 7890',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        trailing:  Icon(
                          Icons.phone,
                          size: 28,
                          color: Colors.grey.shade600,
                        ),


                      ),
                    );
                  },

                  //
                ),
              ),
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
                    color: Theme.of(context).cardColor,
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
                  Icons.dialpad,
                  size: 30,
                  color: Theme.of(context).cardColor.darken(13),
                ),
              ),
            ),
          ],
        ),
        );
  }
}
