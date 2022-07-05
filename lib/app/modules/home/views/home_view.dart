import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homectr = Get.put(HomeController());

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
              GestureDetector(
                onTap: () {
                  //image thimgs;
                },
                child: CircleAvatar(
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assetes/images/deffault.jpg")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 400,
                  height: 600,
                  child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 28,
                          ),
                          title: GetBuilder<HomeController>(
                            builder: (GetxController controller) {
                              return Text("${homectr.user_model.name}");
                            },
                          ),
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
                          title: Text("${homectr.user_model.email}"),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                          ),
                          title: Text("${homectr.user_model.phone}"),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                      SizedBox(
                        height: 190,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            homectr.logout();
                          },
                          child: Text("SingOut"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
