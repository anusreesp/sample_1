import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sample_1/domain/usecases/login_usecases.dart';
import 'package:sample_1/domain/usecases/signup_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequestEvent>((event, emit) async {
      try {
        emit(LoginInitial());
        final loginDetails =
            await LoginUseCases().getLoginDatas(event.email, event.password);

        emit(LoginLoaded(loginDetails));
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });

    on<SignUpRequestEvent>((event, emit) async {
      try {
        emit(SignUpInitial());

        final signupDetails = await SignUpUsecases()
            .getSignUpDetails(event.email, event.password);

        emit(SignUpLoaded(signupDetails));
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    });

    on<CurrentUserCheckEvent>((event, emit) async {
      try {
        emit(AuthInitial());
        final user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          emit(AuthNotLogged());
        } else {
          emit(AuthLogged(user));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
