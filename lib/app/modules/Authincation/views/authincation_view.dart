import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loginapp/app/modules/loginPage/views/login_page_view.dart';

import '../../buttomNavagtion/views/controll_room_view.dart';
import '../controllers/authincation_controller.dart';

class AuthincationView extends GetView<AuthincationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, users) {
            if (users.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (users.hasData) {
              if (users.hasData == true) {
                return SignupPage();
              }
              return Controll();
            } else if (users.hasError) {
              return SignupPage();
            }
            return SignupPage();
          }),
    );
  }
}
