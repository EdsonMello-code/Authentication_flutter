import 'package:authentication/app/features/auth/presenter/shared/components/button_action_widget.dart';
import 'package:authentication/app/features/auth/presenter/shared/components/buttons_oath_widget.dart';
import 'package:authentication/app/features/auth/presenter/shared/components/email_text_field_widget.dart';
import 'package:authentication/app/features/auth/presenter/shared/components/password_text_field_widget.dart';
import 'package:authentication/app/features/auth/presenter/shared/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:authentication/app/features/auth/presenter/shared/colors/colors.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset('assets/images/signup.png'),
            SizedBox(
              height: 25,
            ),
            Container(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.signupTitle,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primaryColor),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                        child: Column(
                      children: [
                        ButtonsOAthWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        EmailTextFieldWidget(
                          controller: TextEditingController(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PasswordTextFieldWidget(
                          controller: TextEditingController(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                            Icons.face,
                          )),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonActionWidget(
                      title: 'Sign up',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
