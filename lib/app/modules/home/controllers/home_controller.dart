import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/data/ueerModel.dart';
import 'package:loginapp/app/modules/loginPage/views/login_page_view.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      user_model = UserModel.fromeMap(value.data());
      update();
    });
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel user_model = UserModel();
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(SignupPage());
  }
}
