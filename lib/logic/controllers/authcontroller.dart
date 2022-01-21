// ignore_for_file: avoid_print, unused_local_variable

import 'package:ecommerceapp/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcontroller extends GetxController {
  bool isVisible = false;
  bool ischecked = false;
  String displayUserName = '';
  String displayUserPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignin = GoogleSignIn();
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
        displayUserName = name;
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
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void loginFireBase({required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName = auth.currentUser!.displayName!);
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
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void googlesignUpFireBase() async {
    final GoogleSignInAccount? googleUser = await googleSignin.signIn();
    try {
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void facebooksignUpFireBase() async {}
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
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logOutFireBase() async {}
}
