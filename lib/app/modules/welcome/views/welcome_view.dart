import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skype_clone/app/Widgets_&_Classes/animationsWidgets/WelcomeWidgets/AddName.dart';
import 'package:skype_clone/app/Widgets_&_Classes/animationsWidgets/WelcomeWidgets/CreatePassword.dart';
import 'package:skype_clone/app/Widgets_&_Classes/animationsWidgets/WelcomeWidgets/OTPVerification.dart';

import '../../../Widgets_&_Classes/animationsWidgets/WelcomeWidgets/LetsGetStarted.dart';
import '../../../Widgets_&_Classes/animationsWidgets/WelcomeWidgets/Logo.dart';
import '../../../Widgets_&_Classes/animationsWidgets/WelcomeWidgets/PhoneSignUp.dart';
import '../../../Widgets_&_Classes/animationsWidgets/WelcomeWidgets/SignInBackground.dart';
import '../../../Widgets_&_Classes/animationsWidgets/WelcomeWidgets/SignInMenu.dart';
import '../../../Widgets_&_Classes/animationsWidgets/WelcomeWidgets/UpperContainer.dart';
import '../../../Widgets_&_Classes/animationsWidgets/WelcomeWidgets/Welcome.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.stackController?.isCompleted == true) {
          controller.stackController?.reverse();
          controller.showfirst.value = !controller.showfirst.value;
        }
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnimatedBuilder(
          animation: Listenable.merge([
            controller.signinController,
            controller.animeController,
            controller.phoneSignUpController,
            controller.createPasswordController,
            controller.addNameController,
            controller.OTPController
          ]),
          builder: (BuildContext context, _) {
            return Column(
              children: <Widget>[
                UpperContainer(),
                Logo(),
                Obx(() {
                  return Container(
                      // color: Colors.blueGrey,
                      alignment: Alignment.topCenter,
                      height: (MediaQuery.of(context).size.height / 3) +
                          ((controller.tweenanimation?.value *
                                  (MediaQuery.of(context).size.height / 3)) /
                              100) +
                          (controller.logocontainertween?.value *
                              ((MediaQuery.of(context).size.height / 3) -
                                  ((MediaQuery.of(context).size.height / 3) -
                                      150)) /
                              150),
                      child: Opacity(
                          opacity: controller.tweenanimation?.value / 100,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                top: controller.showfirst.value
                                    ? 0
                                    //(MediaQuery.of(context).size.height / 3)
                                    : -((MediaQuery.of(context).size.height /
                                            3) *
                                        2),
                                child: Welcome(),
                              ),
                              LetsGetStarted(),
                              //use animated positioned khiir
                              AnimatedPositioned(
                                  duration: Duration(milliseconds: 300),
                                  bottom: (controller.booltween?.value != 1
                                      ? -MediaQuery.of(context).size.height
                                      : 0),
                                  child: Stack(children: <Widget>[
                                    SignInBackground(),
                                    AnimatedPositioned(
                                        //fix movie tween or make new tween
                                        duration: Duration(milliseconds: 300),
                                        right:
                                            (controller.booltween2?.value != 1
                                                ? -MediaQuery.of(context)
                                                    .size
                                                    .height
                                                : 0),
                                        child: Opacity(
                                            opacity:
                                                (controller.booltween3?.value /
                                                            100 -
                                                        1) *
                                                    -1,
                                            child: SignInMenu())),
                                    AnimatedPositioned(
                                        duration: Duration(milliseconds: 300),
                                        right:
                                            (controller.booltween3?.value != 100
                                                ? -MediaQuery.of(context)
                                                    .size
                                                    .height
                                                : 0),
                                        child: Opacity(
                                            opacity: (controller
                                                            .createPasswordtween
                                                            ?.value /
                                                        100 -
                                                    1) *
                                                -1,
                                            child: PhoneSignUp())),
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 300),
                                      right: (controller
                                                  .createPasswordtween?.value !=
                                              100
                                          ? -MediaQuery.of(context).size.height
                                          : 0),
                                      child: Opacity(
                                          opacity:
                                              (controller.addNametween?.value /
                                                          100 -
                                                      1) *
                                                  -1,
                                          child: CreatePassword()),
                                    ),
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 300),
                                      right: (controller.addNametween?.value !=
                                              100
                                          ? -MediaQuery.of(context).size.height
                                          : 0),
                                      child: Opacity(
                                          opacity: (controller.OTPtween?.value /
                                                      100 -
                                                  1) *
                                              -1,
                                          child: AddName()),
                                    ),
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 300),
                                      right: (controller.OTPtween?.value != 100
                                          ? -MediaQuery.of(context).size.height
                                          : 0),
                                      child: OTPVerification(),
                                    )
                                  ])),
                            ],
                          ))
                      //create a column with three containers two for text and last one for button

                      );
                })
              ],
            );
          },
        ),
      ),
    );
  }
}
