import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_getX/controllers/bindings/userController.dart';
import 'package:todo_getX/models/user.dart';
import 'package:todo_getX/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseuser = Rx<User>();

//observable outputs a stream that the user needs
  User get user => _firebaseuser.value;

  @override
  void onInit() {
    _firebaseuser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String email, String password, String name) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create a user in firestore
      UserModel _user = UserModel(
          id: _authResult.user.uid, name: name, email: _authResult.user.email);
      if (await Database().createNewUser(_user)) {
        //user created successfully
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error creating account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar("Error logging in", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar("Error signing out", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
