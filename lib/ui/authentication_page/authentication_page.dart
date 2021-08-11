import 'package:flutter/material.dart';
import 'package:socials/ui/authentication_page/widgets/custom_rounded_button.dart';
import 'package:socials/ui/homescreen/homescreen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Sign In"),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),

                CustomRoundedButton(
                    text: "Sign Up",
                    onPressed: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context)=> HomeScreen()
                          )
                      );
                    }
                ),

                Text("Or"),
                Text("Sign up"),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Confirm Password"
                  ),
                ),

                CustomRoundedButton(
                  text: "Sign Up",
                  onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                            builder: (context)=> HomeScreen()
                        )
                    );
                  }
                )
              ],
            )
        )
    );
  }
}
