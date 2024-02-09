import 'package:sample_1/data/repositories/signup_repository.dart';
import 'package:sample_1/domain/repo/signup_repo.dart';

class SignUpUsecases {
  getSignUpDetails(String email, String password) {
    SignUpRepo signUpRepo = SignUpRepoImpl();

    final details = signUpRepo.getSignUpData(email, password);
    return details;
  }
}
