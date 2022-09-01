import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../modules/welcome/controllers/welcome_controller.dart';

class UpperContainer extends StatelessWidget {
  var controller = Get.find<WelcomeController>();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animeController!,
      builder: (BuildContext context, _) {
        return Container(
          height: (MediaQuery.of(context).size.height / 3) -
              ((controller.tweenanimation?.value *
                      (MediaQuery.of(context).size.height / 3)) /
                  100),
        );
      },
    );
  }
}
