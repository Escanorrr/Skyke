import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tinycolor2/tinycolor2.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../controllers/welcome_controller.dart';

class PhoneSignUp extends StatelessWidget {
  var controller = Get.find<WelcomeController>();
  @override
  Widget build(BuildContext context) {
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
              'Create account',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            child: IntlPhoneField(
              decoration: InputDecoration(
                isDense: true,
                counter: Offstage(),
                hintText: 'Phone Number',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      // width: 3,
                      color: Theme.of(context).cardColor.darken(13)),
                ),
              ),
              // controller: controller.IntlPhonecontroller,
              initialCountryCode: 'US',
              showDropdownIcon: true,
              dropdownIconPosition: IconPosition.trailing,
              showCountryFlag: false,
              textAlignVertical: TextAlignVertical.bottom,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).cardColor.lighten(3),
              ),
              onChanged: (phone) {
                print(phone.completeNumber);
                controller.phoneNumber = phone.completeNumber;
              },
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: RaisedButton(
                  color: Theme.of(context).cardColor.darken(15),
                  child: Text(
                    'Back',
                  ),
                  onPressed: () {
                    controller.switchPhoneSignUpBool();
                    Future.delayed(Duration(milliseconds: 300), () {
                      controller.switchSignInMenuOpacity();
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Next',
                  ),
                  onPressed: () {
                    controller.gotoCreatePassword();
                  },
                ),
              ),
            ],
          ),

          // SizedBox(
          //   height: 60,
          //   child: RaisedButton(
          //     color: Theme.of(context).cardColor.darken(13),
          //     elevation: 1,
          //     child: Text(
          //       'Next',
          //     ),
          //     onPressed: () {
          //       //go to otp wigdet with controller
          //
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
