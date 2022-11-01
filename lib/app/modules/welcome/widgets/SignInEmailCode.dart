import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../controllers/welcome_controller.dart';

class SignInEmailCode extends StatelessWidget {
  const SignInEmailCode({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var controller = Get.find<WelcomeController>();
    var phoneNumber = controller.phoneNumber;
    var emailCodeController = TextEditingController();
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 85,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //create a back button
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal:  5),
                  constraints: BoxConstraints(),
                  iconSize: 18,

                  // alignment: Alignment.centerLeft,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    controller.switchAddNameBool();
                    Future.delayed(Duration(milliseconds: 300), () {
                      controller.switchCreatePasswordOpacity();
                    });
                    //reverse the current controller to the previous screen
                  },
                ),
                Text(
                  '$phoneNumber',
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Text(
              'Enter Code',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Enter the code we sent to dj********@gmail.com',
            style: TextStyle(
              fontSize: 15,
              // fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          TextField(
            controller: emailCodeController,
            //obscureText: checkBoxValue.value,
            focusNode: FocusNode(),
            //keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter Code',
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              //controller.gotoPhoneSignUp();
            },
            child: Text(
              'Use your Password instead',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue.shade500,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              //controller.gotoPhoneSignUp();
            },
            child: Text(
              'This isn\'t my number',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue.shade500,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          //create a row of two buttons aligned to the right
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(

                    'Sign in',
                    style: TextStyle(
                     // color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
