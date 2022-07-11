import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../home/controllers/home_controller.dart';

class UpadatePageController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  final homecontroller2 = Get.put(HomeController());

  File? image;
  String? imagurl;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final phoneNumber = TextEditingController();
  final name = TextEditingController();

  dataUpdateing() async {
    User? user = auth.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"phone": phoneNumber.text, "name": name.text});
    update();
    await homecontroller2.gatdate();
  }

  Future uplodeProfile() async {
    final pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickimage == null) {
      Get.snackbar("No Image", "image not seleceted");
    }
    image = File(pickimage!.path);
    update();
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child("image/${user!.uid}");
    UploadTask uploadTask = firebaseStorageRef.putFile(image!);
    var taskSnapshot = await uploadTask.whenComplete(() {
      Get.snackbar("", "Profile added");
    });
    final urlDownloded = await taskSnapshot.ref.getDownloadURL();
    imagurl = urlDownloded;
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
      "phone": phoneNumber.text,
      "name": name.text,
      "image": imagurl.toString()
    });
    update();
  }
}
