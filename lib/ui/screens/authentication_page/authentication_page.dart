import 'package:flutter/material.dart';
import 'package:socials/ui/screens/authentication_page/widgets/custom_rounded_button.dart';
import 'package:socials/ui/screens/homescreen/homescreen.dart';
import 'package:socials/utils/APIKEYS.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:socials/utils/helpers/authentication.dart';
import 'package:provider/provider.dart';
import 'package:socials/utils/models/twitter/twitter.dart';


class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController signinEmail = new TextEditingController();
  final TextEditingController signinPassword = new TextEditingController();
  final TextEditingController signupEmail = new TextEditingController();
  final TextEditingController signupPassword = new TextEditingController();
  final TextEditingController signupConfirmPassword = new TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [

                Text("Sign In"),
                TextFormField(
                  controller: signinEmail,
                  decoration: InputDecoration(
                    labelText: "Email"
                  ),
                ),
                TextFormField(
                  controller: signinPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                ),

                CustomRoundedButton(
                    text: "Sign In",
                    onPressed: () async {
                      context.read<AppState>().user = await firebaseLogInWithEmail(
                          context: context,
                          email: signinEmail.text,
                          password: signinPassword.text
                      );


                      if (context.read<AppState>().user != null)
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
                  controller: signupEmail,
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),
                TextFormField(
                  controller: signupPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                ),
                TextFormField(
                  controller: signupConfirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirm Password"
                  ),
                ),

                CustomRoundedButton(
                  text: "Sign Up",
                  onPressed: () async {


                    context.read<AppState>().user = await firebaseSignUpWithEmail(
                        email: signupEmail.text.trim().toLowerCase(),
                        password: signupPassword.text,
                        context: context
                    );

                    if (context.read<AppState>().user != null)
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

  @override
  void dispose() {
    signupPassword.dispose();
    signupEmail.dispose();
    signupConfirmPassword.dispose();
    signinPassword.dispose();
    signinEmail.dispose();
    super.dispose();
  }
}
