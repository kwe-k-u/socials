import 'package:flutter/material.dart';
import 'package:socials/ui/authentication_page/authentication_page.dart';
import 'package:socials/ui/homescreen/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationScreen(),
    );
  }
}

