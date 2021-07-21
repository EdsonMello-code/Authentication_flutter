import 'package:authentication/app/features/auth/presenter/login/controllers/login_controller.dart';
import 'package:authentication/app/features/shared/strings/strings.dart';
import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  final void Function(String?)? onFieldSubmitted;
  const PasswordTextFieldWidget(
      {Key? key,
      required this.controller,
      this.focusNode,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  late final LoginController loginController;

  @override
  void initState() {
    loginController = LoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      validator: (password) => loginController.passwordValidate(password),
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            size: 20,
          ),
          labelText: Strings.password),
    );
  }
}
