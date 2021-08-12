import 'package:flutter/material.dart';




final borderRadius = BorderRadius.circular(14.0);



///Displays a snackbar with the [message] and [backgroundColor] passed. If [backgroundColor]
void showSnack({
  required BuildContext context,
  required String message,
  Color? backgroundColor}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      )
  );
}