import 'package:flutter/material.dart';
import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/helpers/helper.dart';
import 'package:socials/utils/helpers/twitter.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:provider/provider.dart';


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
            onTap: () async{
              Map<String, dynamic>? map = await Twitter().authenticate();

              switch (map["status"]) {
                case TwitterLoginStatus.loggedIn:
                  context.read<AppState>()
                      .addKey(
                      platform: PlatformEnum.twitter,
                      keyMap: {
                        "authToken" : map["authToken"],
                        "authTokenSecret": map["authTokenSecret"]
                      }
                      );
                  break;
                case null:
                case TwitterLoginStatus.error:
                  showSnack(
                      context: context,
                      message: "An error was encountered. Please try again"
                  );
                  break;
                case TwitterLoginStatus.cancelledByUser:
              }
            },
          ),
        ],
      ),
    );
  }
}
