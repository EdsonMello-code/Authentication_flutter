import 'package:flutter/material.dart';
import 'package:authentication/app/features/auth/presenter/shared/colors/colors.dart';

class ButtonsOAthWidget extends StatefulWidget {
  const ButtonsOAthWidget({Key? key}) : super(key: key);

  @override
  _ButtonsOAthWidgetState createState() => _ButtonsOAthWidgetState();
}

class _ButtonsOAthWidgetState extends State<ButtonsOAthWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primaryColor),
            fixedSize: MaterialStateProperty.all(
              const Size(83, 40),
            ),
          ),
          onPressed: () {},
          child: Container(),
        ),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primaryColor),
              fixedSize: MaterialStateProperty.all(
                const Size(83, 40),
              ),
            ),
            child: Container()),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primaryColor),
              fixedSize: MaterialStateProperty.all(
                const Size(83, 40),
              ),
            ),
            child: Container()),
      ],
    );
  }
}
