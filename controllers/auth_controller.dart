import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/controllers.dart';
import '../model/admin.dart';
import '../view/onboarding_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgetPword = TextEditingController();
  var adminModel = AdminModel().obs;
  Rx<bool> isVisible = true.obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  void signOut() async {
    auth.signOut();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => OnBoardingScreen());
    } else {
      // ===== in case it doesnt work
      // -----7-----
      // adminModel.bindStream(listenToUser());
      // -----6-----
      // Get.offAll(() => MyHomePage());
    }
  }

  void signIn() async {
    try {
      isLoading(true);
      await auth
          .signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((value) {
        isLoading(false);
      });

      // -----5-----
      //   Get.offAll(() => MyHomePage());
      _clearControllers();
    } catch (e) {
      isLoading(false);
      debugPrint(e.toString());
      Get.snackbar(
        'Sign In Failed',
        'Try again',
      );
    }
  }

  void signUp() async {
    try {
      isLoading(true);
      await auth
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((result) {
        isLoading(false);
        String _userId = result.user!.uid;

        // _addUserToFirestore(_userId);

        // -----1-----
        // setUser(AdminModel(
        //   name: name.text.trim(),
        //   email: email.text.trim(),
        //   id: _userId,
        // ));
        _clearControllers();
      });
      // -----2-----
      // Get.offAll(() => MyHomePage()
      // );
    } catch (e) {
      isLoading(true);
      debugPrint(e.toString());
      Get.snackbar(
        'Sign Up Failed',
        'Try again',
        //snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  ///====== getting all the users who
  ///created account name and email

// -----4-----
  // Stream<AdminModel> listenToUser() => firebaseFirestore
  //     .collection('admin')
  //     .doc(firebaseUser.value!.uid)
  //     .snapshots()
  //     .map((snapshot) => AdminModel.fromJson(snapshot));

  //======= Set new user =======

  // -----3-----
  // Future<void> setUser(AdminModel adminModel) {
  //   return firebaseFirestore
  //       .collection('admin')
  //       .doc(adminModel.id)
  //       .set(adminModel.toMap());
  // }

  void forgetPassword(String email) {
    auth.sendPasswordResetEmail(email: email).then((value) {
      Get.snackbar("Email Sent", "We have sent password reset to email");
    }).catchError((e) {
      print("There was an error sending email $e");
    });
  }
}
