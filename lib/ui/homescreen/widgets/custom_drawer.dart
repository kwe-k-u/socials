import 'package:flutter/material.dart';
import 'package:socials/ui/settings_page/settings_page.dart';


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

            },
          ),
        ],
      ),
    );
  }
}
