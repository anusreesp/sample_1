import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_1/application/core/widgets/border_textfield.dart';
import 'package:sample_1/application/core/widgets/next_button.dart';
import 'package:sample_1/application/features/auth/authbloc/auth_bloc.dart';
import 'package:sample_1/application/features/auth/login.dart';
import 'package:sample_1/application/features/auth/widgets/background.dart';
import 'package:sample_1/application/features/dashboard/home.dart';
import 'package:sample_1/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  GlobalKey signupKey = GlobalKey();
  String email = '';
  String password = '';
  String confirmCassword = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.11,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: size.width * 0.7,
                    padding: const EdgeInsets.only(left: 12),
                    child: const Text(
                      'Create your account for the next step',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkBlue1Color),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                BorderTextField(onchanged: (val) {}, hintText: 'User Name'),
                BorderTextField(
                    onchanged: (val) {
                      email = val;
                    },
                    hintText: 'Email'),
                BorderTextField(
                    onchanged: (val) {
                      password = val;
                    },
                    hintText: 'Password'),
                BorderTextField(
                    onchanged: (val) {
                      if (val == password) {
                        confirmCassword = val;
                      }
                    },
                    hintText: 'Confirm Password'),
                SizedBox(
                  height: size.height * 0.1,
                ),
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  return NextButton(
                      width: size.width * 0.92,
                      bgColor: const Color.fromARGB(255, 169, 255, 246),
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignUpRequestEvent(email, confirmCassword));

                        if (state is SignUpLoaded) {
                          if (state.userDetails?.uid != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {}
                        }
                      },
                      widget: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppTheme.darkBlue1Color,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ));
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('You already have account ?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          'Login',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
