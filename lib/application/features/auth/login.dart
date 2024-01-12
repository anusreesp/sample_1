import 'package:flutter/material.dart';
import 'package:sample_1/application/core/widgets/textfield.dart';
import 'package:sample_1/application/features/auth/widgets/background.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  GlobalKey loginkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const Background(),
      Form(
          key: loginkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BorderTextField(
                onchanged: (val) {
                  debugPrint("email ---->$val");
                },
                hintText: 'Email',
              )
            ],
          ))
    ]));
  }
}
