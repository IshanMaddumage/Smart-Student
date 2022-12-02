import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:smart_student_academy/screens/main/home.dart';
import 'package:smart_student_academy/utils/alert_helper.dart';
import 'package:smart_student_academy/utils/util_functions.dart';
import '../screens/users/login_screen.dart';
import 'package:path/path.dart';

class AuthController {
  //firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //firebase firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //a function to save user data in databse
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String firstname,
    String lastname,
    String birthday,
    String mobilenumber,
    String gender,
    String address,
    String school,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //check if the usercredential object is not null
      if (userCredential.user != null) {
        //show an alert after finishing saving user data
        // ignore: use_build_context_synchronously
        await AlertHelper().showAlert(
          context,
          DialogType.success,
          'SUCCESS',
          'User registered successfully!',
        );

        //save other data to cloud firestore
        await saveUserData(
          userCredential.user!.uid,
          email,
          firstname,
          lastname,
          birthday,
          mobilenumber,
          gender,
          address,
          school,
        );
      }
    } on FirebaseAuthException catch (e) {
      //show an error alert
      AlertHelper().showAlert(context, DialogType.error, 'ERROR', e.code);
    } catch (e) {
      Logger().e(e);

      //show an error alert
      AlertHelper().showAlert(context, DialogType.error, 'ERROR', e.toString());
    }
  }

  //...................a function to save user data on firestore
  Future<void> saveUserData(
    String uid,
    String email,
    String firstname,
    String lastname,
    String birthday,
    String mobilenumber,
    String gender,
    String address,
    String school,
  ) async {
    try {
      return firestore
          .collection('users')
          .doc(uid)
          .set({
            'firstname': firstname,
            'lastname': lastname,
            'birthday': birthday,
            'phonenumber': mobilenumber,
            'gender': gender,
            'address': address,
            'school': school,
            'uid': uid,
          })
          .then((value) => Logger().i("User Added"))
          .catchError((error) => Logger().e("Failed to add user: $error"));
    } catch (e) {
      Logger().e(e);
    }
  }

  //..................Login function
  Future<void> logingUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().w(userCredential);
    } on FirebaseAuthException catch (e) {
      //show an error alert
      AlertHelper().showAlert(context, DialogType.error, 'ERROR', e.code);
    }
  }

  //..................initialize and check weather the user is sign in or not
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        UtilFunctions.navigateTo(context, const LoginScreen());
        Logger().i('User is currently signed out!');
      } else {
        UtilFunctions.navigateTo(context, const Home());
        Logger().i('User is signed in!');
      }
    });
  }

  //..................logout function
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //..................picked file upload to firebase storage
  UploadTask? uploadFile(File img) {
    try {
      final fileName = basename(img.path);
      final destination = 'profileImage/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(img);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
