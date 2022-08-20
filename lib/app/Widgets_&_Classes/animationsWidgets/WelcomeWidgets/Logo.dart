import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class Logo extends GetView<WelcomeController> {
  /// Here is your constructor
  Logo();

  @override
  Widget build(BuildContext context) {
    return _buildLogo(context);
  }

  Widget _buildLogo(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.signinController!,
      builder: (BuildContext context, _) {
        return Container(
          // color: Colors.green,
          height: (MediaQuery.of(context).size.height / 3) -
              (controller.logocontainertween?.value),
          child: Center(
            child:
                //make an animated logo that contains an image that pops up with animator
                Animator<double>(
              duration: Duration(milliseconds: 700),
              tween: Tween<double>(begin: 0.0, end: 100.0),
              curve: Curves.easeInOut,
              repeats: 1,
              cycles: 3,
              builder: (context, AnimatorState, child) => Center(
                child: Container(
                  // color: Colors.red,
                  height: AnimatorState.value - (controller.logotween?.value),
                  width: AnimatorState.value - (controller.logotween?.value),
                  child:
                      Image.asset('assets/images/logo.png', fit: BoxFit.fill),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
