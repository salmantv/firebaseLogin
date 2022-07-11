import 'package:get/get.dart';
import 'package:loginapp/app/modules/buttomNavagtion/controllers/buttom_navagtion_controller.dart';

class ButtonnavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtonnavigationController>(
      () => ButtonnavigationController(),
    );
  }
}
