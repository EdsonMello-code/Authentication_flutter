import 'package:authentication/app/features/shared/strings/strings.dart';
import 'package:flutter/material.dart';

class EmailTextFieldWidget extends StatefulWidget {
  const EmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
