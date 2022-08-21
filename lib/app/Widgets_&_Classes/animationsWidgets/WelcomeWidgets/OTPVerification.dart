import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class OTPVerification extends StatelessWidget {
  /// Here is your constructor
  OTPVerification();

  @override
  Widget build(BuildContext context) {
    return _buildOTPVerification(context);
  }

  Widget _buildOTPVerification(BuildContext context) {
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
                'OTP Verification ',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                Get.find<WelcomeController>().phoneNumber.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Pinput(
              length: 6,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.darken(15),
                  // border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onCompleted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                    verificationId:
                        Get.find<WelcomeController>().verificationCode!,
                    smsCode: pin,
                  ))
                      .then((value) async {
                    if (value.user != null) {
                      print("pass to home");
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  print("repeat the code retard");
                }
              },
            )
          ],
        ));
  }
}
