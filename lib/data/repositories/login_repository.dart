import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_1/data/datasources/login_remote_datasource.dart';
import 'package:sample_1/domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<User?> getLoginData(String email, String password) {
    LoginRemoteDatasource loginRemoteDatasource = LoginRemoteDatasourceImp();

    final loginData = loginRemoteDatasource.getLoginFromFire(email, password);

    return loginData;
  }
}
