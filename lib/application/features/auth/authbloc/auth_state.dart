part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthNotLogged extends AuthState {}

final class AuthLogged extends AuthState {
  final User? userDetails;
  const AuthLogged(this.userDetails);
  @override
  List<Object> get props => [];
}

final class AuthError extends AuthState {
  const AuthError(this.error);

  final String error;
}

final class LoginInitial extends AuthState {}

final class LoginLoaded extends AuthState {
  final User? userDetails;
  const LoginLoaded(this.userDetails);
  @override
  List<Object> get props => [];
}

final class LoginError extends AuthState {
  const LoginError(this.error);

  final String error;
}

final class SignUpInitial extends AuthState {}

final class SignUpLoaded extends AuthState {
  final User? userDetails;
  const SignUpLoaded(this.userDetails);
  @override
  List<Object> get props => [];
}

final class SignUpError extends AuthState {
  const SignUpError(this.error);

  final String error;
}
