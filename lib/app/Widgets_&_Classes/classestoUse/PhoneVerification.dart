import 'package:firebase_auth/firebase_auth.dart';

class PhoneVerification {
  var firebaseAuth = FirebaseAuth.instance;
  static const maxRequestsCount = 3;
  static var verificationId = '';
  static String? authUid = '';
  static String? phone = '';
  static int requestsCount = 0;

  Future<void> sendOtpToPhone(
      String phone, Function onSuccess, Function onError) async {
    if (requestsCount <= maxRequestsCount) {
      await firebaseAuth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phone,
          verificationCompleted: (AuthCredential authCredential) {
            if (firebaseAuth.currentUser != null) {
              print('verificationCompleted function');
            }
          },
          verificationFailed: (authException) {
            print('verificationFailed Exception' + authException.toString());
            onError();
          },
          codeSent: (String id, int? forceResent) {
            PhoneVerification.phone = phone;
            verificationId = id;
            requestsCount++;
            onSuccess();
          },
          codeAutoRetrievalTimeout: (String id) {
            verificationId = id;
          });
    } else {
      onError();
    }
  }

  Future<void> otpVerification(
      String otp, Function onSuccess, Function onError) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: otp));
      if (userCredential.user != null) {
        authUid = firebaseAuth.currentUser?.uid;
        onSuccess();
      }
    } on Exception catch (e) {
      onError();
    }
  }
}
