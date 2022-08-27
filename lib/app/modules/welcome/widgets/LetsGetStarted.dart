import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class LetsGetStarted extends GetView<WelcomeController> {
  /// Here is your constructor
  LetsGetStarted();

  @override
  Widget build(BuildContext context) {
    return _buildLetsGetStarted(context);
  }

  Widget _buildLetsGetStarted(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.stackController!,
      builder: (BuildContext context, _) {
        return Positioned(
            // height: 0,
            child: Opacity(
          opacity: (controller.stacktween?.value / 100) *
              ((150 - controller.logocontainertween?.value) / 150) *
              1,
          child: Container(
            // color: Colors.white,
            height: ((MediaQuery.of(context).size.height / 3) * 2) *
                (150 - controller.logocontainertween?.value / 150),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text(
                    'Let\'s get started',
                    style: TextStyle(
                      fontSize: 30,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                SizedBox(
                  height: 45,
                  width: 240,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    child: Text('Sign in or create',
                        style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      print("in pressed funct");
                      controller.signin();
                      // controller.onClick();
                      //Get.toNamed('/home');
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: Text(
                    'Use your Skype or your Microsoft account.Need help?',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 190,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      // color: Colors.red,
                      // height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 110,
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/images/microsoftlogo.png',
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Terms of Use',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '  Privacy and Cookies',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: Text(
                        '8.86.0.407',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
