// ignore_for_file: unnecessary_new, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simple_animations/simple_animations.dart';

import '../../../routes/app_pages.dart';

class WelcomeController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement WelcomeController

  String? verificationCode;
  String? phoneNumber;
  String? password;
  String? firstName;
  String? lastName;
  String?  email ;

  var signInMenuOpacity = 1.obs;

  var signInEmailCodeBool = false.obs;
  var signInEmailCodeOpacity = 1.obs;

  var signInOptionsBool = false.obs;
  var signInOptionsOpacity = 1.obs;

  var phoneSignUpBool = false.obs;
  var phoneSignUpOpacity = 1.obs;

  var createPasswordBool = false.obs;
  var createPasswordOpacity = 1.obs;

  var addNameBool = false.obs;
  var addNameOpacity = 1.obs;

  var OTPVerificationBool = false.obs;
  var OTPVerificationOpacity = 1.obs;

  AnimationController? animeController;
  AnimationController? stackController;
  AnimationController? signinController;

  Animation? tweenanimation;
  Animation? stacktween;
  Animation? logocontainertween;
  Animation? logotween;
  Animation? booltween;
  Animation? signInMenutween;

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

    Future.delayed(Duration(milliseconds: 1000), () {
      animeController?.forward();
    });
  }

  void onClick() {
    showfirst.value = !showfirst.value;
  }

  double TweenPercentage(double tweenValue, int max, double height) {
    return (tweenValue / max) * height;
  }

  void welcomestack() {
    Future.delayed(Duration(milliseconds: 1000), () {
      stackController?.forward();
    });
  }

  void gotoPhoneSignInMenu() {
    Future.delayed(Duration(milliseconds: 1000), () {
      signinController?.forward();
      print(logocontainertween?.value);
    });
  }

  void switchSignInMenuOpacity() {
    if (signInMenuOpacity.value == 0) {
      signInMenuOpacity.value = 1;
    } else {
      signInMenuOpacity.value = 0;
    }
  }
  void gotosignInEmailCode(String phoneNumber) {
    //phoneSignUpController?.forward();
    sendEmailCode(phoneNumber);
    switchSignInMenuOpacity();
    //print(signInMenuOpacity);
    Future.delayed(Duration(milliseconds: 300), () {
      switchSignInEmailCodeBool();
    });
  }
  void switchSignInEmailCodeOpacity() {
    if (signInEmailCodeOpacity.value == 0) {
      signInEmailCodeOpacity.value = 1;
    } else {
      signInEmailCodeOpacity.value = 0;
    }
  }

  void switchSignInEmailCodeBool() {
    if (signInEmailCodeBool.value == false) {
      signInEmailCodeBool.value = true;
    } else {
      signInEmailCodeBool.value = false;
    }
  }

  void gotoPhoneSignUp() {
    //phoneSignUpController?.forward();
    switchSignInMenuOpacity();
    //print(signInMenuOpacity);
    Future.delayed(Duration(milliseconds: 300), () {
      switchPhoneSignUpBool();
    });
  }

  void switchPhoneSignUpOpacity() {
    if (phoneSignUpOpacity.value == 0) {
      phoneSignUpOpacity.value = 1;
    } else {
      phoneSignUpOpacity.value = 0;
    }
  }

  void switchPhoneSignUpBool() {
    if (phoneSignUpBool.value == false) {
      phoneSignUpBool.value = true;
    } else {
      phoneSignUpBool.value = false;
    }
  }

  void gotoCreatePassword() {
    //createPasswordController?.forward();
    switchPhoneSignUpOpacity();
    Future.delayed(Duration(milliseconds: 300), () {
      switchCreatePasswordBool();
    });
  }

  void switchCreatePasswordBool() {
    if (createPasswordBool.value == false) {
      createPasswordBool.value = true;
    } else {
      createPasswordBool.value = false;
    }
  }

  void switchCreatePasswordOpacity() {
    if (createPasswordOpacity.value == 0) {
      createPasswordOpacity.value = 1;
    } else {
      createPasswordOpacity.value = 0;
    }
  }

  void gotoAddName() {
    //addNameController?.forward();
    switchCreatePasswordOpacity();
    Future.delayed(Duration(milliseconds: 300), () {
      switchAddNameBool();
    });
  }

  void switchAddNameBool() {
    if (addNameBool.value == false) {
      addNameBool.value = true;
    } else {
      addNameBool.value = false;
    }
  }

  void switchAddNameOpacity() {
    if (addNameOpacity.value == 0) {
      addNameOpacity.value = 1;
    } else {
      addNameOpacity.value = 0;
    }
  }

  void gotoOTPVerification() {
    switchAddNameOpacity();
    Future.delayed(Duration(milliseconds: 300), () {
      switchOTPVerificationBool();
    });
    verifyPhoneNumber();
    print('chercking strings $password $firstName $lastName');
  }

  void switchOTPVerificationBool() {
    if (OTPVerificationBool.value == false) {
      OTPVerificationBool.value = true;
    } else {
      OTPVerificationBool.value = false;
    }
  }

  void switchOTPVerificationOpacity() {
    if (OTPVerificationOpacity.value == 0) {
      OTPVerificationOpacity.value = 1;
    } else {
      OTPVerificationOpacity.value = 0;
    }
  }

  void gotoSignInOptions() {
    switchSignInMenuOpacity();

    Future.delayed(Duration(milliseconds: 300), () {
      switchSignInOptionsBool();
    });
  }

  void switchSignInOptionsBool() {
    if (signInOptionsBool.value == false) {
      signInOptionsBool.value = true;
    } else {
      signInOptionsBool.value = false;
    }
  }

  void switchSignInOptionsOpacity() {
    if (signInOptionsOpacity.value == 0) {
      signInOptionsOpacity.value = 1;
    } else {
      signInOptionsOpacity.value = 0;
    }
  }

  void validateEmailOTP(String otp){
    var validation = (EmailAuth (
      sessionName: 'Skyke Email Verification',
    ).validateOtp(
        recipientMail: email!,
        userOtp: otp));
    if (validation){
      print('Email OTP is valid');
      Get.offAllNamed(Routes.HOME);
    }
    else{
      print('Email OTP is invalid, repeat the process pls!');
    }
  }
  //create a function that gets a user phone number as a parameter and extracts the email of that phone number then sends an email to that email with a code
  void sendEmailCode(String phoneNumber) async {
    //get the email of the phone number
    String? tempEmail = await getEmail(phoneNumber);
    //print('tempemail is $tempEmail');
    if (tempEmail != null) {

      email = tempEmail;
      EmailAuth (
        sessionName: 'Skyke Email Verification',
      ).sendOtp( recipientMail:email!,otpLength: 6);
    }
    else {
      print('email is null');
    }
  }
  //implement getEmail function
  Future<String?> getEmail(String phoneNumber) async {
    String? eemail;
    await FirebaseFirestore.instance
        .collection('users')
        .where("phoneNumber",isEqualTo: phoneNumber).
        get().then((value) {
          print("the email brought is : " + value.docs[0].data()['email']);
          eemail = value.docs[0].data()['email'];
        });
    return eemail;
  }

  void verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              addUser();
              Get.offAllNamed(Routes.HOME);
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

  void addUser() async {
    final usersdb = FirebaseFirestore.instance.collection('users').doc();
    //FirebaseAuth.instance.signInWithEmailLink(email: , emailLink: );
    await usersdb

        .set({
          'id': usersdb.id,
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'password': password,
        })
        .then((_) => print("user has been added successfully!!!"))
        .catchError((error) =>
            print("user has not been added for this error : $error"));

    print("we crossed adding");
  }

  void exitWidgets() {
    if (addNameOpacity.value == 0) {
      switchOTPVerificationBool();
      Future.delayed(Duration(milliseconds: 300), () {
        switchAddNameOpacity();
      });
    } else {
      if (createPasswordOpacity.value == 0) {
        switchAddNameBool();
        Future.delayed(Duration(milliseconds: 300), () {
          switchCreatePasswordOpacity();
        });
      } else {
        if (phoneSignUpOpacity.value == 0) {
          switchCreatePasswordBool();
          Future.delayed(Duration(milliseconds: 300), () {
            switchPhoneSignUpOpacity();
          });
        } else {
          if (signInMenuOpacity.value == 0) {
            if (phoneSignUpBool.value == true) {
              switchPhoneSignUpBool();
            }
            if (signInOptionsBool.value == true) {
              switchSignInOptionsBool();
            }
            if (signInEmailCodeBool.value == true) {
              switchSignInEmailCodeBool();
            }
            Future.delayed(Duration(milliseconds: 300), () {
              switchSignInMenuOpacity();
            });
          } else {
            if (signinController?.isCompleted == true) {
              signinController?.reverse();
            } else {
              if (stackController?.isCompleted == true) {
                stackController?.reverse();
                showfirst.value = !showfirst.value;
              }
            }
          }
        }
      }
    }
  }

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
