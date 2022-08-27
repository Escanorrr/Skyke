import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../modules/welcome/controllers/welcome_controller.dart';

class UpperContainer extends GetView<WelcomeController> {
  /// Here is your constructor
  UpperContainer();

  @override
  Widget build(BuildContext context) {
    return _buildUpperContainer(context);
  }

  Widget _buildUpperContainer(BuildContext context) {
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
