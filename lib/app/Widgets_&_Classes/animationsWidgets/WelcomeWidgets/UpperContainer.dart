import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class UpperContainer extends StatelessWidget {
  /// Here is your constructor
  UpperContainer();

  @override
  Widget build(BuildContext context) {
    return _buildUpperContainer(context);
  }

  Widget _buildUpperContainer(BuildContext context) {
    return AnimatedBuilder(
      animation: Get.find<WelcomeController>().animeController!,
      builder: (BuildContext context, _) {
        return Container(
          height: (MediaQuery.of(context).size.height / 3) -
              ((Get.find<WelcomeController>().tweenanimation?.value *
                      (MediaQuery.of(context).size.height / 3)) /
                  100),
        );
      },
    );
  }
}
