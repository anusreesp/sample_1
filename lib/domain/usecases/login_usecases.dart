import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_1/data/repositories/login_repository.dart';
import 'package:sample_1/domain/repo/login_repo.dart';

class LoginUseCases {
  LoginRepo loginRepo = LoginRepoImpl();

  Future<User?> getLoginDatas(String email, String password) {
    final userDetails = loginRepo.getLoginData(email, password);
    return userDetails;
  }
}
