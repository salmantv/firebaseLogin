// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/app/modules/loginPage/controllers/login_page_controller.dart';
import 'package:loginapp/app/modules/singUpPage/views/sing_up_page_view.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final login = Get.put(LoginPageController());

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
                  child: Text("SignUp",
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
                ElevatedButton(
                    onPressed: () {
                      login.fireBaseAuth();
                    },
                    child: Text("SingUp")),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(SingUpPageView());
                    },
                    child: Text('Login'))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
