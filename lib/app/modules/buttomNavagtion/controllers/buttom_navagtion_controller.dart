import 'package:get/get.dart';
import 'package:loginapp/app/modules/addindgData/controllers/addindg_data_controller.dart';
import 'package:loginapp/app/modules/home/controllers/home_controller.dart';

class ButtonnavigationController extends GetxController {
  int updatedvalue = 0;
  final home = Get.put(HomeController());
  final itemcontroller = Get.put(AddindgDataController());

  buttonnavigationcontroll(index) async {
    updatedvalue = index;
    await home.gatdate();
    await itemcontroller.fetchRecdes();
    update();
  }
}
