import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/controllers/home_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UpadatePageController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  File? image;
  String? imagurl;

  @override
  void onInit() {
    super.onInit();
    emailController.text = homecontroller2.user_model.email.toString();
    name.text = homecontroller2.user_model.name.toString();
    phoneNumber.text = homecontroller2.user_model.phone.toString();
  }

  Future uplodeProfile() async {
    final pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickimage == null) {
      Get.snackbar("", "No image selected");
    }
    image = File(pickimage!.path);
    update();

    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child("image/${user!.uid}");
    UploadTask uploadTask = firebaseStorageRef.putFile(image!);
    var taskSnapshot = await uploadTask.whenComplete(() {});
    final urlDownloded = await taskSnapshot.ref.getDownloadURL();
    print(urlDownloded);
  }

  Future upadateData() async {
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
      'name': name,
      "email": emailController,
      'phone': phoneNumber,
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final homecontroller2 = Get.put(HomeController());
}
