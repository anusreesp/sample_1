import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRemoteDataSource {
  getSignedUp(String email, String password);
}

class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  @override
  Future<User?> getSignedUp(String email, String password) async {
    final fire = FirebaseAuth.instance;
    try {
      await fire.createUserWithEmailAndPassword(
          email: email, password: password);

      return fire.currentUser;
    } catch (e) {
      rethrow;
    }
  }
}
