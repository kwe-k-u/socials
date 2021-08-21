import 'package:flutter/material.dart';


class CustomRoundedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomRoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text)
    );
  }
}
