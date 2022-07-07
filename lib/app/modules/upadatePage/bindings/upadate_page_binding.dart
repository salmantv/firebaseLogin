import 'package:get/get.dart';

import '../controllers/upadate_page_controller.dart';

class UpadatePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpadatePageController>(
      () => UpadatePageController(),
    );
  }
}
