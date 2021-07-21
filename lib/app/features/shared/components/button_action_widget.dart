import 'package:flutter/material.dart';
import 'package:authentication/app/features/shared/colors/colors.dart';

class ButtonActionWidget extends StatelessWidget {
  final String title;

  final void Function() onPressed;

  const ButtonActionWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primaryColor;

    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          fixedSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width, 40),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ));
  }
}
