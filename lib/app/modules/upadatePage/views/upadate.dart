import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/modules/buttomNavagtion/views/controll_room_view.dart';
import 'package:loginapp/app/modules/home/controllers/home_controller.dart';
import 'package:loginapp/app/modules/upadatePage/controllers/upadate_page_controller.dart';

class UpadatePageView extends StatelessWidget {
  UpadatePageView({Key? key}) : super(key: key);

  final upadateCtroll = Get.put(UpadatePageController());
  final homecontroller2 = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    upadateCtroll.name.text = homecontroller2.user_model.name!;
    upadateCtroll.phoneNumber.text = homecontroller2.user_model.phone!;
    return Scaffold(
        body: Container(
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
      SizedBox(
        height: 40,
      ),
      Center(
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      GestureDetector(
        onTap: () async {
          await upadateCtroll.uplodeProfile();
        },
        child: GetBuilder<UpadatePageController>(builder: (controller) {
          return homecontroller2.user_model.imageUrl != null
              ? upadateCtroll.image != null
                  ? CircleAvatar(
                      backgroundImage: FileImage(upadateCtroll.image!),
                      radius: 45,
                    )
                  : CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "${homecontroller2.user_model.imageUrl}"),
                    )
              : CircleAvatar(
                  radius: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset("assetes/images/deffault.jpg")),
                );
        }),
      ),
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              width: 400,
              height: 600,
              child: ListView(
                children: [
                  Text(
                    "User Name",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GetBuilder<UpadatePageController>(
                    builder: (GetxController controller) {
                      return TextField(
                        controller: upadateCtroll.name,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: upadateCtroll.phoneNumber,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await upadateCtroll.dataUpdateing();
                        Get.off(Controll());
                      },
                      child: Text("Upadate")),
                ],
              )))
    ])))));
  }
}
