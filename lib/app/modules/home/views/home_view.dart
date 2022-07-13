import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loginapp/app/modules/buttomNavagtion/views/controll_room_view.dart';
import 'package:loginapp/app/modules/upadatePage/views/upadate.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final homecontroller1 = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
      children: [
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
        GetBuilder<HomeController>(
          builder: (GetxController controller) {
            return homecontroller1.user_model.imageUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${homecontroller1.user_model.imageUrl}",
                    ),
                    radius: 45,
                  )
                : CircleAvatar(
                    radius: 40,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset("assetes/images/deffault.jpg")),
                  );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 400,
            height: 600,
            child: InkWell(
              onTap: () async {
                await homecontroller1.gatdate();
                Get.to(UpadatePageView());
              },
              child: GetBuilder<HomeController>(builder: (controller) {
                return ListView(
                  children: [
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 28,
                        ),
                        title: GetBuilder<HomeController>(builder: (context) {
                          return Text("${homecontroller1.user_model.name}");
                        }),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          size: 28,
                        ),
                        title: Text("${homecontroller1.user_model.email}"),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: GetBuilder<HomeController>(builder: (context) {
                        return ListTile(
                          leading: Icon(
                            Icons.phone,
                          ),
                          title: Text("${homecontroller1.user_model.phone}"),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          homecontroller1.logout();
                        },
                        child: Text("SingOut"))
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    )))));
  }
}
