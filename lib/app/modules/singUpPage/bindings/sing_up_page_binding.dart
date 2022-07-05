import 'package:get/get.dart';

import '../controllers/sing_up_page_controller.dart';

class SingUpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingUpPageController>(
      () => SingUpPageController(),
    );
  }
}
