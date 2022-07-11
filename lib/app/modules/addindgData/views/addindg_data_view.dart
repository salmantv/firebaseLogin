import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addindg_data_controller.dart';

class AddindgDataView extends GetView<AddindgDataController> {
  final itemcontroller = Get.put(AddindgDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AddindgDataController>(
      builder: (controller) {
        return itemcontroller.baskitem.isEmpty
            ? Container(
                child: Center(
                    child: Text(
                  "No prodect add ",
                  style: TextStyle(color: Colors.black54),
                )),
              )
            : ListView.builder(
                itemCount: itemcontroller.baskitem.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(itemcontroller.baskitem[index].name),
                        subtitle: Text(itemcontroller.baskitem[index].price),
                      ),
                    ),
                  );
                }));
      },
    ));
  }
}
