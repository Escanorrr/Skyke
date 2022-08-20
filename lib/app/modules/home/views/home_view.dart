import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:animator/animator.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child:
            //make an animated logo that contains an image that pops up with animator
            Animator<double>(
          duration: Duration(seconds: 2),
          tween: Tween<double>(begin: 0.0, end: 100.0),
          curve: Curves.easeInOut,
          repeats: 1,
          cycles: 3,
          builder: (context, AnimatorState, child) => Center(
            child: Container(
              height: AnimatorState.value,
              width: AnimatorState.value,
              child: Image.asset('assets/images/logo.png', fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
