import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/data/ueerModel.dart';
import 'package:loginapp/app/modules/Authincation/views/authincation_view.dart';
import 'package:loginapp/app/modules/buttomNavagtion/views/controll_room_view.dart';

class SingUpPageController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future firBaseAuth() async {
    if (emailController.text == "" ||
        phoneNumber.text == "" ||
        name.text == "" ||
        password.text == "") {
      Get.snackbar("Somthing Worong", "Please fill up All filed");
      return;
    }

    await auth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: password.text)
        .then((value) {
      dataSendingfirbase();
      Get.snackbar("", "SingUp Succses");
    }).catchError((e) {
      Get.snackbar("", "${e.message}", snackStyle: SnackStyle.FLOATING);
    });
  }

  dataSendingfirbase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel usermodel = UserModel();
    if (user!.email == "") {
      return;
    }
    usermodel.email = user.email;
    usermodel.uid = user.uid;
    usermodel.name = name.text;
    usermodel.phone = phoneNumber.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());
    Get.offAll(Controll());
  }
}
