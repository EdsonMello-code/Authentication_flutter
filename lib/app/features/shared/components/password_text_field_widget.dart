import 'package:authentication/app/features/shared/strings/strings.dart';
import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({Key? key}) : super(key: key);

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            size: 20,
          ),
          labelText: Strings.password),
    );
  }
}
