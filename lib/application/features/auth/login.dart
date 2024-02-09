import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_1/application/core/widgets/needle_line.dart';
import 'package:sample_1/application/core/widgets/next_button.dart';
import 'package:sample_1/application/core/widgets/border_textfield.dart';
import 'package:sample_1/application/features/auth/authbloc/auth_bloc.dart';
import 'package:sample_1/application/features/auth/signup.dart';
import 'package:sample_1/application/features/auth/widgets/background.dart';
import 'package:sample_1/application/features/dashboard/home.dart';
import 'package:sample_1/theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  GlobalKey loginkey = GlobalKey();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      const Background(),
      Form(
          key: loginkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Image.asset(
              //     'assets/images/auth/3_girls_gang.png',
              //     width: size.width * 0.5,
              //   ),
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: size.width * 0.7,
                  padding: const EdgeInsets.only(left: 12),
                  child: const Text(
                    'Login if you are a member',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.darkBlue1Color),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              BorderTextField(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                onchanged: (val) {
                  email = val;
                },
                hintText: 'Email',
              ),
              BorderTextField(
                  onchanged: (val) {
                    password = val;
                  },
                  hintText: 'Password'),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  const Spacer(),
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                    return NextButton(
                        bgColor: const Color.fromARGB(255, 169, 255, 246),
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(LoginRequestEvent(email, password));

                          if (state is LoginLoaded) {
                            debugPrint("-------user------${state.userDetails}");
                            if (state.userDetails?.uid != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            } else {}
                          }
                        },
                        widget: const Row(
                          children: [
                            Text(
                              ' Login  ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ));
                  }),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeedleHorizontal(
                    width: size.width * 0.26,
                    height: 3,
                    flip: true,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Or',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  NeedleHorizontal(
                    width: size.width * 0.26,
                    height: 3,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconTextButton(
                      onTap: () {},
                      icon: Icons.g_mobiledata_rounded,
                      // color: AppTheme.blue1Color,
                      text: 'Google'),
                  const SizedBox(
                    width: 12,
                  ),
                  IconTextButton(
                      onTap: () {},
                      icon: Icons.facebook_outlined,
                      color: AppTheme.darkBlue1Color,
                      text: 'Facebook')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You dont have account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ))
    ]));
  }
}
