import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class Welcome extends StatelessWidget {
  var controller = Get.find<WelcomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: (controller.tweenanimation?.value / 100) * 40,
          ),
          Container(
            child: Text(
              'Welcome to Skype',
              style: TextStyle(
                fontSize: 30,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'Free HD video and voice calls',
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              'anywhere in the world.',
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: (controller.tweenanimation?.value / 100) * 250,
          ),
          Container(
            child: SizedBox(
              width: (controller.tweenanimation?.value / 100) * 250,
              height: (controller.tweenanimation?.value / 100) * 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                child: Text('Let\'s go',
                    style: TextStyle(
                        fontSize:
                            (controller.tweenanimation?.value / 100) * 20)),
                onPressed: () {
                  controller.onClick();
                  controller.welcomestack();
                  //Get.toNamed('/home');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
