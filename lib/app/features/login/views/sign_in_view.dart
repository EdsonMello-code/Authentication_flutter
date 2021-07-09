import 'package:authentication/app/features/shared/components/button_action_widget.dart';
import 'package:authentication/app/features/shared/components/buttons_oath_widget.dart';
import 'package:authentication/app/features/shared/components/email_text_field_widget.dart';
import 'package:authentication/app/features/shared/components/password_text_field_widget.dart';
import 'package:authentication/app/features/shared/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:authentication/app/features/shared/colors/colors.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Image.asset('assets/images/login.png'),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        Strings.signinTitle,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, top: 20),
                      child: Form(
                          child: Column(
                        children: [
                          const EmailTextFieldWidget(),
                          const SizedBox(
                            height: 18,
                          ),
                          const PasswordTextFieldWidget(),
                          const SizedBox(
                            height: 40,
                          ),
                          const ButtonActionWidget(
                            title: Strings.signinTitle,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            '${Strings.signinLabel}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const ButtonsOAthWidget(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(Strings.signinSublabel,
                                  style:
                                      const TextStyle(color: Colors.black87)),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  ' ' + Strings.signinLink,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
