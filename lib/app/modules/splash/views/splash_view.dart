import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            //get image from assets
            Container(
                height: 110,
                width: 110,
                child: Image.asset('assets/images/logo.png', fit: BoxFit.fill)),
      ),
      bottomSheet: Container(
        height: 150,
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
    );
  }
}
