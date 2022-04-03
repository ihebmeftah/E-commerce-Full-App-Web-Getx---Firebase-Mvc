// ignore_for_file: avoid_print, unused_local_variable

import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcontroller extends GetxController {
  var dropdownValue = 'One'.obs;

  bool isVisible = false;
  bool ischecked = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserMail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignin = GoogleSignIn();
  bool isSignIn = false;
  final GetStorage authbox = GetStorage();

  User? get userProfile => auth.currentUser;
  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "") ?? "id";

    displayUserPhoto.value =
        (userProfile != null ? userProfile!.photoURL : "") ?? "";
    displayUserMail.value = (userProfile != null ? userProfile!.email : "")!;
    super.onInit();
  }

  void visibile() {
    isVisible = !isVisible;
    update();
  }

  void check() {
    ischecked = !ischecked;
    update();
  }

  void signUpFireBase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(20),
          borderWidth: 2,
          borderColor: Colors.white);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(20),
          borderWidth: 2,
          borderColor: Colors.white);
    }
  }

  void loginFireBase({required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSignIn = true;
      authbox.write("auth", isSignIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(20),
          borderWidth: 2,
          borderColor: Colors.white);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          margin: const EdgeInsets.all(20),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
    }
  }

  void googlesignUpFireBase() async {
    final GoogleSignInAccount? googleUser = await googleSignin.signIn();
    try {
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserMail.value = googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential cred = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await auth.signInWithCredential(cred);

      isSignIn = true;
      authbox.write("auth", isSignIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(20),
          borderWidth: 2,
          borderColor: Colors.white);
    }
  }

  void passwordResetFireBase(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(20),
          borderWidth: 2,
          borderColor: Colors.white);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
          colorText: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(20),
          borderWidth: 2,
          borderColor: Colors.white);
    }
  }

  void logOutFireBase() async {
    try {
      await auth.signOut();
      await googleSignin.signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      isSignIn = false;
      authbox.remove("auth");
      update();
      Get.offAllNamed(Routes.loginScreen);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(20),
          borderWidth: 2,
          borderColor: Colors.white);
    }
  }
}
