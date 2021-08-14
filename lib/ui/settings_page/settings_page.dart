import 'package:flutter/material.dart';
import 'package:socials/ui/settings_page/widgets/add_account_popup.dart';

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
            Expanded(
                child: ListView(
              children: [
                Text("Linked Accounts"),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("Add another account"),
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => AddAccountPopup()
                    );
                    },
                ),
              ],
                )
            )
          ],
        )
        )
    );
  }
}
