import 'package:flutter/material.dart';
import 'package:socials/ui/screens/settings_page/widgets/add_account_popup.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:provider/provider.dart';

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
            Text("Linked Accounts"),
            Expanded(
                child: ListView.builder(
                  itemCount: context.read<AppState>().keys!.keys.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(context.read<AppState>().keys!.keys.keys.elementAt(index).toString().split(".")[1]),

                    );
              },
                ),
            ),

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
    );
  }
}
