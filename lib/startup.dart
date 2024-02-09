import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_1/application/features/auth/authbloc/auth_bloc.dart';
import 'package:sample_1/application/features/auth/login.dart';
import 'package:sample_1/application/features/auth/signup.dart';
import 'package:sample_1/application/features/dashboard/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const StartupPage(),
    );
  }
}

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  User? user;
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(CurrentUserCheckEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, state) {
        if (state is AuthLogged) {
          // return const HomePage();
          return SignUpPage();
        } else if (state is AuthNotLogged) {
          return LoginPage();
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  'Something went wrong.... please check after sometimes....')));
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
