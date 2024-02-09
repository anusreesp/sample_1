import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginRemoteDatasource {
  getLoginFromFire(String email, String password);
}

class LoginRemoteDatasourceImp extends LoginRemoteDatasource {
  FirebaseAuth fireAuth = FirebaseAuth.instance;

  @override
  Future<User?> getLoginFromFire(String email, String password) async {
    try {
      final login = await fireAuth.signInWithEmailAndPassword(
          email: email, password: password);

      debugPrint("-------------$login");

      final userDetails = fireAuth.currentUser;
      debugPrint("-------------$userDetails");

      return userDetails;
    } catch (e) {
      rethrow;
    }
  }
}
