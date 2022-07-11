import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/data/itemModel.dart';
import 'package:loginapp/app/modules/home/controllers/home_controller.dart';

class AddindgDataController extends GetxController {
  final home = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    home.gatdate();
    fetchRecdes();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("items")
        .snapshots()
        .listen((records) {
      mapRecord(records);
    });
  }

  final prodectcontroller = TextEditingController();
  final pricecontroller = TextEditingController();

  List<Item> baskitem = [];
  User? user = FirebaseAuth.instance.currentUser;

  Future fetchRecdes() async {
    var allitems = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("items")
        .get();
    mapRecord(allitems);
  }

  Future mapRecord(QuerySnapshot<Map<String, dynamic>> records) async {
    // ignore: avoid_single_cascade_in_expression_statements
    var itemList = records.docs
        .map((item) =>
            Item(id: item.id, name: item["name"], price: item["price"]))
        .toList();
    baskitem = itemList;
    update();
  }

  Future addItem({required String name, required String price}) async {
    if (name == "" || price == "") {
      Get.snackbar("", "Invalid value");
      return;
    }
    var iteme = Item(id: "id", name: name, price: price);
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("items")
        .add(iteme.toJson());
    update();
    prodectcontroller.clear();
    pricecontroller.clear();
  }
}
