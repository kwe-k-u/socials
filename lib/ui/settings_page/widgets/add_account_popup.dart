import 'package:flutter/material.dart';


class AddAccountPopup extends StatelessWidget {
  const AddAccountPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          ListTile(
            title: Text("Facebook"),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("Instagram"),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("Snapchat"),
            onTap: (){

            },
          ),
          ListTile(
            title: Text("Twitter"),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}
