import 'package:sample_1/data/datasources/signup_remote_datasource.dart';
import 'package:sample_1/domain/repo/signup_repo.dart';

class SignUpRepoImpl extends SignUpRepo {
  @override
  getSignUpData(String email, String password) async {
    SignUpRemoteDataSource signUpRemoteDataSource =
        SignUpRemoteDataSourceImpl();

    final signupData =
        await signUpRemoteDataSource.getSignedUp(email, password);

    return signupData;
  }
}
