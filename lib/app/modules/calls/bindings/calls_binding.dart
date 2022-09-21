import 'package:get/get.dart';

import '../controllers/calls_controller.dart';

class CallsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallsController>(
      () => CallsController(),
    );
  }
}
