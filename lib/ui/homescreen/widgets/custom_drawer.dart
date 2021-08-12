import 'package:flutter/material.dart';
import 'package:socials/ui/authentication_page/authentication_page.dart';
import 'package:socials/ui/settings_page/settings_page.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:socials/utils/helpers/authentication.dart';
import 'package:provider/provider.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          ListTile(
            title: Text("Chat Bot"),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("Settings"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> SettingsPage()
                  )
              );
            },
          ),
          ListTile(
            title: Text("About Us"),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("Log out"),
            onTap: (){

              firebaseSignOut().then((value) {
                context.read<AppState>().user = null;
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> AuthenticationScreen()
                    )
                );
              });

            },
          ),
        ],
      ),
    );
  }
}
