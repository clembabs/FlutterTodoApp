import 'package:get/get.dart';
import 'package:todo_getX/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  //Set the value and be able to obs from anywhere in the App
  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
} 