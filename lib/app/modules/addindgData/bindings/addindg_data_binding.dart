import 'package:get/get.dart';

import '../controllers/addindg_data_controller.dart';

class AddindgDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddindgDataController>(
      () => AddindgDataController(),
    );
  }
}
