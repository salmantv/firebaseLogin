import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/modules/home/controllers/home_controller.dart';

import '../controllers/buttom_navagtion_controller.dart';

// ignore: must_be_immutable
class ButtonnavigationView extends StatelessWidget {
  ButtonnavigationView({Key? key}) : super(key: key);
  final homectroller = Get.put(HomeController());
  final getcontroller = Get.put(ButtonnavigationController());

  @override
  Widget build(BuildContext context) {
    // homectroller.gatdate();

    return SizedBox(
      height: 70,
      child: GetBuilder<ButtonnavigationController>(
        builder: (controller) {
          return BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: getcontroller.updatedvalue,
              fixedColor: Colors.black,
              onTap: (index) {
                getcontroller.buttonnavigationcontroll(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "",
                    backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              ]);
        },
      ),
    );
  }
}
