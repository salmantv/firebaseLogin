import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loginapp/app/modules/addindgData/controllers/addindg_data_controller.dart';
import 'package:loginapp/app/modules/addindgData/views/addindg_data_view.dart';
import 'package:loginapp/app/modules/buttomNavagtion/views/buttom_navagtion_view.dart';
import 'package:loginapp/app/modules/home/views/home_view.dart';
import '../controllers/buttom_navagtion_controller.dart';

class Controll extends StatelessWidget {
  Controll({Key? key}) : super(key: key);
  final itemcontroller = Get.put(AddindgDataController());
  final pages = [
    AddindgDataView(),
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () async {
              await showDinlgo(context);
            }),
        bottomNavigationBar: ButtonnavigationView(),
        body: GetBuilder<ButtonnavigationController>(
            init: ButtonnavigationController(),
            builder: (controller) {
              return pages[controller.updatedvalue];
            }));
  }

  Future showDinlgo(context) async {
    Get.defaultDialog(
        title: "Add something",
        content: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: itemcontroller.prodectcontroller,
                decoration: InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                  controller: itemcontroller.pricecontroller,
                  decoration: InputDecoration(
                      hintText: "Price", border: OutlineInputBorder())),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var prodectext =
                        itemcontroller.prodectcontroller.text.trim();
                    var pricetext = itemcontroller.pricecontroller.text.trim();
                    await itemcontroller.addItem(
                        name: prodectext, price: pricetext);
                    Get.back();
                  },
                  child: Text("add"))
            ],
          ),
        )));
  }
}
