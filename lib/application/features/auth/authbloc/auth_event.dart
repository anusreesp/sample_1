part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequestEvent extends AuthEvent {
  final String email, password;
  LoginRequestEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignUpRequestEvent extends AuthEvent {
  final String email, password;
  SignUpRequestEvent(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class CurrentUserCheckEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
