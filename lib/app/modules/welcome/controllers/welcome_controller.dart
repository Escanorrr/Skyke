// ignore_for_file: unnecessary_new, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simple_animations/simple_animations.dart';

class WelcomeController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement WelcomeController

  String? verificationCode;
  String? phoneNumber;
  String? password;
  String? firstName;
  String? lastName;

  AnimationController? animeController;
  AnimationController? stackController;
  AnimationController? signinController;
  AnimationController? phoneSignUpController;
  AnimationController? createPasswordController;
  AnimationController? addNameController;
  AnimationController? OTPController;
  AnimationController? signInOptionsController;

  Animation? tweenanimation;
  Animation? stacktween;
  Animation? logocontainertween;
  Animation? logotween;
  Animation? booltween;
  Animation? signInMenutween;
  Animation? phoneSignUptween;
  Animation? createPasswordtween;
  Animation? addNametween;
  Animation? OTPtween;
  Animation? signInOptionstween;

  // Animation<TimelineValue<AnimeProps>?>? generalAnimation;
  // MovieTween? signinmovie;
  final bool2 = MovieTweenProperty<double>();

  var showfirst = true.obs;
  final count = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    animeController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    stackController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    signinController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    phoneSignUpController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    createPasswordController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    addNameController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    OTPController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    signInOptionsController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    //Now the animations
    //
    //
    //
    //

    tweenanimation = Tween(begin: 0.0, end: 100.0).animate(new CurvedAnimation(
      parent: animeController!,
      curve: Curves.easeInOut,
    ));

    stacktween = Tween(begin: 0.0, end: 100.0).animate(
      new CurvedAnimation(
        parent: stackController!,
        curve: Curves.easeInOut,
      ),
    );

    logocontainertween =
        Tween<double>(begin: 0, end: 150).animate(new CurvedAnimation(
      parent: signinController!,
      curve: Interval(
        0,
        0.5,
        curve: Curves.ease,
      ),
    ));
    logotween = Tween<double>(begin: 0, end: 40).animate(new CurvedAnimation(
      parent: signinController!,
      curve: Interval(
        0,
        0.5,
        curve: Curves.ease,
      ),
    ));
    booltween = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(
      parent: signinController!,
      curve: Interval(
        0,
        0.5,
        curve: Curves.ease,
      ),
    ));

    signInMenutween =
        Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(
      parent: signinController!,
      curve: Interval(
        0.75,
        1,
        curve: Curves.ease,
      ),
    ));

    //new controller for phone sign up animation
    phoneSignUptween =
        Tween<double>(begin: 0, end: 100).animate(new CurvedAnimation(
      parent: phoneSignUpController!,
      curve: Interval(
        0,
        1,
        curve: Curves.ease,
      ),
    ));

    createPasswordtween =
        Tween<double>(begin: 0, end: 100).animate(new CurvedAnimation(
      parent: createPasswordController!,
      curve: Interval(
        0,
        1,
        curve: Curves.ease,
      ),
    ));

    addNametween =
        Tween<double>(begin: 0, end: 100).animate(new CurvedAnimation(
      parent: addNameController!,
      curve: Interval(
        0,
        1,
        curve: Curves.ease,
      ),
    ));

    OTPtween = Tween<double>(begin: 0, end: 100).animate(new CurvedAnimation(
      parent: OTPController!,
      curve: Interval(
        0,
        1,
        curve: Curves.ease,
      ),
    ));
    signInOptionstween = Tween<double>(begin: 0, end: 100).animate(
      new CurvedAnimation(
        parent: signInOptionsController!,
        curve: Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    Future.delayed(Duration(milliseconds: 1000), () {
      animeController?.forward();
    });
  }

  void onClick() {
    showfirst.value = !showfirst.value;
  }

  void welcomestack() {
    Future.delayed(Duration(milliseconds: 1000), () {
      stackController?.forward();
    });
  }

  void signin() {
    Future.delayed(Duration(milliseconds: 1000), () {
      signinController?.forward();
      print(logocontainertween?.value);
    });
  }

  void createaccount() {
    phoneSignUpController?.forward();
  }

  void gotoCreatePassword() {
    createPasswordController?.forward();
  }

  void gotoAddName() {
    addNameController?.forward();
  }

  void gotoOTP() {
    OTPController?.forward();
    // verifyPhoneNumber();
    print('chercking strings $password $firstName $lastName');
  }

  void gotoSignInOptions() {
    signInOptionsController?.forward();
  }

  void verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print('userrrrrrrrrrrrrr is logged in');
              // FirebaseAuth.instance.currentUser?.updatePassword('$password');
              // value.user?.updateDisplayName('$firstName $lastName');
              FirebaseAuth.instance.currentUser
                  ?.updateDisplayName('$firstName $lastName');
            } else {
              print('user is not logged in');
            }
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String? verificationId, int? resendToken) {
          verificationCode = verificationId;
          print(verificationCode);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCode = verificationId;
          print(verificationCode);
        },
        timeout: Duration(seconds: 60));
  }

  //create an onclick function that changes the value of the showfirst variable

  void dispose() {
    super.dispose();
    animeController?.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
