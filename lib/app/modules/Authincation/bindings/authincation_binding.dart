import 'package:get/get.dart';

import '../controllers/authincation_controller.dart';

class AuthincationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthincationController>(
      () => AuthincationController(),
    );
  }
}
