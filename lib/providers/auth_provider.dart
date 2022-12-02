import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_student_academy/controllers/auth_controller.dart';

class AuthProvider extends ChangeNotifier {
  //auth contraller instance
  final AuthController _authController = AuthController();

  //store firebase user
  User? _firebaseUser;

  //getter for firebase user
  
}
