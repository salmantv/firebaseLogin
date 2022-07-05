import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/modules/home/views/home_view.dart';

class LoginPageController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future fireBaseAuth() async {
    await auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Get.offAll(HomeView());
      Get.snackbar("", "Login Succses");
    }).catchError((e) {
      Get.snackbar("", "${e.message}");
      emailController.clear();
      passwordController.clear();
    });
  }
}
