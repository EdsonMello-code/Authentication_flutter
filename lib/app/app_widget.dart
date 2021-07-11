import 'package:authentication/app/features/auth/presenter/login/views/sign_in_view.dart';
import 'package:authentication/app/features/auth/presenter/sign_up/views/sign_up_view.dart';
// import 'package:authentication/app/features/presenter/sign_up/views/sign_up_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/signin',
      routes: {
        "/signin": (context) => SignInView(),
        "/signup": (context) => SignUpView()
      },
      home: SignInView(),
    );
  }
}
