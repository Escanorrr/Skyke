import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class SignInMenu extends GetView<WelcomeController> {
  /// Here is your constructor
  SignInMenu();

  @override
  Widget build(BuildContext context) {
    return _buildSignInMenu(context);
  }

  Widget _buildSignInMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 85,
          ),
          Container(
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              'to continue to Skype',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Skype,phone or email',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'No account?',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.createaccount();
                },
                child: Text(
                  'Create one!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
                  color: Theme.of(context).cardColor.darken(15),
                  child: Text(
                    'Back',
                    // style: TextStyle(
                    //   color: Colors
                    //       .white,
                    // ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),

          SizedBox(
            height: 90,
          ),
          //create a button in the center that has the key icon and text
          SizedBox(
            height: 60,
            child: RaisedButton(
              color: Theme.of(context).cardColor.darken(13),
              elevation: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.vpn_key,
                  ),
                  Text(
                    '    Sign-in options',
                  ),
                ],
              ),
              onPressed: () {
                controller.gotoSignInOptions();
              },
            ),
          ),
        ],
      ),
    );
  }
}
