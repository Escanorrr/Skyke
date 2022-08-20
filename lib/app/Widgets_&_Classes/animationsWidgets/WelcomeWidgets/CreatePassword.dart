import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class CreatePassword extends StatelessWidget {
  /// Here is your constructor
  CreatePassword();

  @override
  Widget build(BuildContext context) {
    return _buildCreatePassword(context);
  }

  Widget _buildCreatePassword(BuildContext context) {
    var phoneNumber = Get.find<WelcomeController>().phoneNumber;
    var passwordController = TextEditingController();
    var checkBoxValue = false.obs;
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
                  padding: EdgeInsets.only(left: 0),
                  iconSize: 18,

                  // alignment: Alignment.centerLeft,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
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
              'Create a password',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Enter the password you would like to use with your account.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Obx(
            () => SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - 50,
              child: TextField(
                controller: passwordController,
                obscureText: checkBoxValue.value,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Create password',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Checkbox(
                    // checkColor: Colors.blue,
                    activeColor: Colors.blue,
                    value: checkBoxValue.value,
                    onChanged: (bool? value) {
                      checkBoxValue.value = value!;
                    },
                  )),
              Text(
                'Show password',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'By providing you phone number, you agree to receive service notifications to your mobile phone. Text messaging rates may apply.',
            style: TextStyle(
              fontSize: 13,
              // fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          //create a container with the alignment to the right
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Get.find<WelcomeController>().password =
                      passwordController.text;
                  Get.find<WelcomeController>().gotoAddName();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
