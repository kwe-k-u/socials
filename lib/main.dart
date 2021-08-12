import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socials/ui/authentication_page/authentication_page.dart';
import 'package:socials/utils/app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.done)
          return MaterialApp(
            home: ChangeNotifierProvider(
              create: (context) => AppState(),
              child: AuthenticationScreen(),
            ),
          );

        return Container();
      },
    );
  }
}

