import 'package:get/get.dart';
import 'package:todo_getX/controllers/bindings/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
  
}