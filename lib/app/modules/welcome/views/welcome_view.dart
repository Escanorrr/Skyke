import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';
import '../widgets/phoneSignUp/AddName.dart';
import '../widgets/phoneSignUp/CreatePassword.dart';
import '../widgets/LetsGetStarted.dart';
import '../widgets/Logo.dart';
import '../widgets/phoneSignUp/OTPVerification.dart';
import '../widgets/phoneSignUp/PhoneSignUp.dart';
import '../widgets/SignInMenu.dart';
import '../widgets/UpperContainer.dart';
import '../widgets/Welcome.dart';
import '../widgets/SignInBackground.dart';
import '../widgets/signInOptions.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var oneThirdofScreenHeight = screenHeight / 3;
    return WillPopScope(
      onWillPop: () async {
        controller.exitWidgets();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnimatedBuilder(
          animation: Listenable.merge([
            controller.signinController,
            controller.animeController,
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
                      height: (oneThirdofScreenHeight) +
                          controller.TweenPercentage(
                              controller.tweenanimation?.value,
                              100,
                              oneThirdofScreenHeight) +
                          (controller.logocontainertween?.value *
                              ((oneThirdofScreenHeight) -
                                  ((oneThirdofScreenHeight) - 150)) /
                              150),
                      child: Opacity(
                          opacity: controller.tweenanimation?.value / 100,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                top: controller.showfirst.value
                                    ? 0
                                    //(oneThirdofScreenHeight)
                                    : -((screenHeight / 3) * 2),
                                child: Welcome(),
                              ),
                              LetsGetStarted(),
                              //use animated positioned khiir
                              AnimatedPositioned(
                                  duration: Duration(milliseconds: 300),
                                  bottom: (controller.booltween?.value != 1
                                      ? -screenHeight
                                      : 0),
                                  child: Stack(
                                      // fit: StackFit.,
                                      children: <Widget>[
                                        SignInBackground(),
                                        AnimatedPositioned(
                                          //fix movie tween or make new tween
                                          duration: Duration(milliseconds: 300),
                                          right: (controller
                                                      .signInMenutween?.value !=
                                                  1
                                              ? -screenHeight
                                              : 0),
                                          child: AnimatedOpacity(
                                              opacity: controller
                                                  .signInMenuOpacity.value
                                                  .toDouble(),
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: IgnorePointer(
                                                  ignoring: (controller
                                                          .signInMenuOpacity
                                                          .value !=
                                                      1),
                                                  child: SignInMenu())),
                                        ),
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 300),
                                          right: (controller.signInOptionsBool
                                                      .value !=
                                                  true
                                              ? -screenHeight
                                              : 0),
                                          child: AnimatedOpacity(
                                              //gets effected with the next widget pls add later
                                              opacity: controller
                                                  .signInOptionsOpacity.value
                                                  .toDouble(),
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: IgnorePointer(
                                                  ignoring: (controller
                                                          .signInOptionsOpacity
                                                          .value !=
                                                      1),
                                                  child: signInOptions())),
                                        ),
                                        AnimatedPositioned(
                                            duration:
                                                Duration(milliseconds: 300),
                                            right: (controller.phoneSignUpBool
                                                        .value !=
                                                    true
                                                ? -screenHeight
                                                : 0),
                                            child: AnimatedOpacity(
                                                opacity: controller
                                                    .phoneSignUpOpacity.value
                                                    .toDouble(),
                                                duration:
                                                    Duration(milliseconds: 300),
                                                child: IgnorePointer(
                                                    ignoring: (controller
                                                            .phoneSignUpOpacity
                                                            .value !=
                                                        1),
                                                    child: PhoneSignUp()))),
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 300),
                                          right: (controller.createPasswordBool
                                                      .value !=
                                                  true
                                              ? -screenHeight
                                              : 0),
                                          child: AnimatedOpacity(
                                              opacity: controller
                                                  .createPasswordOpacity.value
                                                  .toDouble(),
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: IgnorePointer(
                                                  ignoring: (controller
                                                          .createPasswordOpacity
                                                          .value !=
                                                      1),
                                                  child: CreatePassword())),
                                        ),
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 300),
                                          right:
                                              (controller.addNameBool.value !=
                                                      true
                                                  ? -screenHeight
                                                  : 0),
                                          child: AnimatedOpacity(
                                              opacity: controller
                                                  .addNameOpacity.value
                                                  .toDouble(),
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: IgnorePointer(
                                                  ignoring: (controller
                                                          .addNameOpacity
                                                          .value !=
                                                      1),
                                                  child: AddName())),
                                        ),
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 300),
                                          right: (controller.OTPVerificationBool
                                                      .value !=
                                                  true
                                              ? -screenHeight
                                              : 0),
                                          child: AnimatedOpacity(
                                              opacity: controller
                                                  .OTPVerificationOpacity.value
                                                  .toDouble(),
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: IgnorePointer(
                                                  ignoring: (controller
                                                          .OTPVerificationOpacity
                                                          .value !=
                                                      1),
                                                  child: OTPVerification())),
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
