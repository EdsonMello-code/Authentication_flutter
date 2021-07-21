import 'package:authentication/app/features/auth/presenter/login/controllers/login_controller.dart';
import 'package:authentication/app/features/shared/strings/strings.dart';
import 'package:flutter/material.dart';

class EmailTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  final FocusNode? focusNode;

  final Function(String)? onFieldSubmitted;

  const EmailTextFieldWidget({
    Key? key,
    required this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextFieldWidget> {
  late final LoginController loginController;

  @override
  void initState() {
    loginController = LoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      validator: (email) => loginController.emailValidate(email),
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.alternate_email,
          size: 20,
        ),
        labelText: Strings.email,
      ),
    );
  }
}
