import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tinycolor2/tinycolor2.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class PhoneSignUp extends GetView<WelcomeController> {
  /// Here is your constructor
  PhoneSignUp();

  @override
  Widget build(BuildContext context) {
    return _buildPhoneSignUp(context);
  }

  Widget _buildPhoneSignUp(BuildContext context) {
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
          SizedBox(
            height: 60,
            child: RaisedButton(
              color: Theme.of(context).cardColor.darken(13),
              elevation: 1,
              child: Text(
                'Next',
              ),
              onPressed: () {
                //go to otp wigdet with controller
                controller.gotoCreatePassword();
              },
            ),
          ),
        ],
      ),
    );
  }
}
