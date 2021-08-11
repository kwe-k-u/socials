import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: BackButton(),
      ),
        body: Container(
        child: Column(
          children: [
            Expanded(child:
            ListView(
              children: [
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text("Facebook"),
                subtitle: Text("username"),
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add another account"),
              ),

            ],))
          ],
        )
        )
    );
  }
}
