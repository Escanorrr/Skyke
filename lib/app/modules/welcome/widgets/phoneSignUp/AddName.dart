import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../controllers/welcome_controller.dart';

class AddName extends GetView<WelcomeController> {
  /// Here is your constructor
  AddName();

  @override
  Widget build(BuildContext context) {
    return _buildAddName(context);
  }

  Widget _buildAddName(BuildContext context) {
    var phoneNumber = controller.phoneNumber;
    var firstnameController = TextEditingController();
    var lastnameController = TextEditingController();

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
              'Whats your name?',
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
            'We need a little more info before you can use this app.',
            style: TextStyle(
              fontSize: 15,
              // fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              controller: firstnameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'First name',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).cardColor.darken(15)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              controller: lastnameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Last name',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).cardColor.darken(15)),
                ),
              ),
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
                  // controller.password = passwordController.text;
                  controller.firstName = firstnameController.text;
                  controller.lastName = lastnameController.text;
                  controller.gotoOTP();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
