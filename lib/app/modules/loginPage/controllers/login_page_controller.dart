import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/modules/buttomNavagtion/views/controll_room_view.dart';

class LoginPageController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future fireBaseAuth() async {
    if (emailController.text == "" || passwordController.text == "") {
      Get.snackbar("", "Please fill up All Filld ");
      return;
    }
    await auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Get.offAll(Controll());
      Get.snackbar("", "Login Succses");
    }).catchError((e) {
      Get.snackbar("", "${e.message}");
      emailController.clear();
    });
  }
}
