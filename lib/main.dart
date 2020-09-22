import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getX/controllers/bindings/authBinding.dart';
import 'package:todo_getX/utils/root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      theme: ThemeData.dark(
      ),
      home: Root(),
    );
  }
}

