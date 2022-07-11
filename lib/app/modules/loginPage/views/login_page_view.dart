// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/modules/home/controllers/home_controller.dart';
import 'package:loginapp/app/modules/loginPage/controllers/login_page_controller.dart';
import 'package:loginapp/app/modules/singUpPage/views/sing_up_page_view.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final login = Get.put(LoginPageController());
  // final home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                  child: Text("Login",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                Form(
                  child: TextFormField(
                    validator: (valu) {
                      if (valu == null || valu.isEmpty) {
                        return "Please Fill The form";
                      } else {
                        return null;
                      }
                    },
                    controller: login.emailController,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: login.passwordController,
                  decoration: const InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                  obscureText: true,
                ),
                SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    await login.fireBaseAuth();
                  },
                  child: Container(
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Color.fromARGB(255, 230, 230, 230),
                      color: Colors.black,
                      elevation: 7,
                      child: const Center(
                          child: Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'))),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(SingUpPageView());
                    },
                    child: Text('SINGUP'))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
