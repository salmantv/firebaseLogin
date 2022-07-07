import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginapp/app/modules/upadatePage/controllers/upadate_page_controller.dart';

class UpadatePageView extends StatefulWidget {
  UpadatePageView({Key? key}) : super(key: key);

  @override
  State<UpadatePageView> createState() => _UpadatePageViewState();
}

class _UpadatePageViewState extends State<UpadatePageView> {
  final upadateCtroll = Get.put(UpadatePageController());
  File? image;
  String? imagurl;

  Future uplodeProfile() async {
    final pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickimage == null) {
      Get.snackbar("", "No image selected");
    }
    image = pickimage as File?;
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    upadateCtroll.onInit();
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
          // await upadateCtroll.();
          upadateCtroll.uplodeProfile();
        },
        child: GetBuilder<UpadatePageController>(builder: (context) {
          return CircleAvatar(
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: upadateCtroll.image == null
                    ? Container()
                    : Image.file(
                        upadateCtroll.image!,
                        fit: BoxFit.cover,
                      )),
          );
        }),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 400,
          height: 600,
          child: InkWell(
            onTap: () {},
            child: ListView(
              children: [
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: upadateCtroll.name,
                  decoration: InputDecoration(border: OutlineInputBorder()),
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
                Text(
                  "Email",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: upadateCtroll.emailController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(onPressed: () async {}, child: Text("Upadate")),
              ],
            ),
          ),
        ),
      )
    ])))));
  }
}
