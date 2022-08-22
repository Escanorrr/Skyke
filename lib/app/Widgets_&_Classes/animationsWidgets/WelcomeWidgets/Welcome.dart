import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
            height:
                (Get.find<WelcomeController>().tweenanimation?.value / 100) *
                    40,
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
            height:
                (Get.find<WelcomeController>().tweenanimation?.value / 100) *
                    250,
          ),
          Container(
            child: SizedBox(
              width:
                  (Get.find<WelcomeController>().tweenanimation?.value / 100) *
                      250,
              height:
                  (Get.find<WelcomeController>().tweenanimation?.value / 100) *
                      45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                child: Text('Let\'s go',
                    style: TextStyle(
                        fontSize: (Get.find<WelcomeController>()
                                    .tweenanimation
                                    ?.value /
                                100) *
                            20)),
                onPressed: () {
                  Get.find<WelcomeController>().onClick();
                  Get.find<WelcomeController>().welcomestack();
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
