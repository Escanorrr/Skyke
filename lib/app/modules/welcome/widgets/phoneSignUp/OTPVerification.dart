import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../controllers/welcome_controller.dart';

class OTPVerification extends StatelessWidget {
  var controller = Get.find<WelcomeController>();
  @override
  Widget build(BuildContext context) {
    var phoneNumber = controller.phoneNumber;
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
                      controller.switchOTPVerificationBool();
                      Future.delayed(Duration(milliseconds: 300), () {
                        controller.switchAddNameOpacity();
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
                'Verify phone number',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'We just sent a code to $phoneNumber.',
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.w800,
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
                    verificationId: controller.verificationCode!,
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
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          'Didn\'t receive it? Please wait a few minutes and '),
                  TextSpan(
                      text: 'resend the code',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('resend the code');
                        }),
                  TextSpan(text: '.'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Choosing '),
                  TextSpan(
                    text: 'Next',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: ' means that you agree to the '),
                  TextSpan(
                      text: 'Privacy Statement',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Privacy Statement');
                        }),
                  TextSpan(text: ' and '),
                  TextSpan(
                      text: 'Microsoft Services Agreement',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Microsoft Services Agreement');
                        }),
                  TextSpan(text: '.'),
                ],
              ),
            )
          ],
        ));
  }
}
