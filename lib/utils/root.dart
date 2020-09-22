import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getX/controllers/bindings/authController.dart';
import 'package:todo_getX/controllers/bindings/userController.dart';
import 'package:todo_getX/screens/home.dart';
import 'package:todo_getX/screens/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return Home();
        } else {
          return Login();
        }
      },
    );
  }
}