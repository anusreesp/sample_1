import 'package:firebase_auth/firebase_auth.dart';

abstract class CurrentUserDataSource {
  getCurrentUserDetails();
}

class CurrentUserDataSourceImpl extends CurrentUserDataSource {
  @override
  getCurrentUserDetails() {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
}
