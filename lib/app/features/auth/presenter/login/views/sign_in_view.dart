import 'package:authentication/app/features/auth/externals/datasources/services/dio_client_http.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:authentication/app/features/auth/domain/DTOs/login_dto.dart';
import 'package:authentication/app/features/auth/domain/usecases/jwt_auth_usecase.dart';
import 'package:authentication/app/features/auth/externals/datasources/login_datasource_impl.dart';
import 'package:authentication/app/features/auth/infra/repositories/auth_repository_impl.dart';

import 'package:authentication/app/features/shared/components/button_action_widget.dart';
import 'package:authentication/app/features/shared/components/buttons_oath_widget.dart';
import 'package:authentication/app/features/shared/components/email_text_field_widget.dart';
import 'package:authentication/app/features/shared/components/password_text_field_widget.dart';
import 'package:authentication/app/features/home/view/home_view.dart';

import 'package:authentication/app/features/shared/strings/strings.dart';
import 'package:authentication/app/features/shared/colors/colors.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final JWTAuthUsecase loginUsecase;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode focusNodeEmail;
  late final FocusNode focusNodePassword;
  late final GlobalKey<FormState> _globalKey;

  @override
  void initState() {
    loginUsecase = JWTAuthUsecase(
      authRepository: AuthRepositoryImpl(
        loginDatasource: LoginDatasourceImpl(
          httpClient: DioHttpClient(dio: Dio()),
        ),
      ),
    );

    emailController = TextEditingController();
    passwordController = TextEditingController();
    focusNodeEmail = FocusNode();
    focusNodePassword = FocusNode();

    _globalKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();

    super.dispose();
  }

  onSubmitted(_) async {
    final isFormValid = _globalKey.currentState!.validate();
    if (!isFormValid) {
      return;
    }

    final user = await loginUsecase(
      LoginDTO(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    user.fold(
      (l) {
        print(l.message);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            duration: const Duration(milliseconds: 800),
            content: const Text(
              'Usuário não encontrado',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
      (r) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeView()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
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
                              key: _globalKey,
                              child: Column(
                                children: [
                                  EmailTextFieldWidget(
                                    focusNode: focusNodeEmail,
                                    controller: emailController,
                                    onFieldSubmitted: (_) =>
                                        focusNodePassword.requestFocus(),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  PasswordTextFieldWidget(
                                    onFieldSubmitted: onSubmitted,
                                    focusNode: focusNodePassword,
                                    controller: passwordController,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ButtonActionWidget(
                                    onPressed: () => onSubmitted(''),
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
                                          style: const TextStyle(
                                              color: Colors.black87)),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed('/signup');
                                        },
                                        child: const Text(
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
        ),
      ),
    );
  }
}
