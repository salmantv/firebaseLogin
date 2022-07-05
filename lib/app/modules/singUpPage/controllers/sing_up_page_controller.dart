import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/data/ueerModel.dart';
import 'package:loginapp/app/modules/home/views/home_view.dart';

class SingUpPageController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final home = Get.put(HomeController());

  Future firBaseAuth() async {
    await auth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: password.text)
        .then((value) {
      dataSendingfirbase();
    }).catchError((e) {
      GetSnackBar(
        message: "$e",
      );
    });
  }

  dataSendingfirbase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel usermodel = UserModel();
    if (user!.email == null) {
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
    // home.onInit();
    Get.offAll(HomeView());
  }
}
