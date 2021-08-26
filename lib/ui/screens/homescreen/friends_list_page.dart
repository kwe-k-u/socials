

import 'package:flutter/material.dart';
import 'package:socials/ui/screens/chat_details_screen/chat_details_screen.dart';
import 'package:socials/ui/screens/homescreen/widgets/friend_list_tile.dart';
import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:provider/provider.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';
import 'package:socials/utils/models/twitter/twitter_user.dart';
import 'package:socials/utils/models/user_abstract.dart';

class FriendsListPage extends StatefulWidget {
  const FriendsListPage({Key? key}) : super(key: key);

  @override
  _FriendsListPageState createState() => _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {

  PlatformEnum _checkFriendType(UserAbstract friend){

    switch (friend.runtimeType){
      // case PlatformEnum.facebook:
      //   // TODO: Handle this case.
      //   break;
      // case PlatformEnum.snapchat:
      //   // TODO: Handle this case.
      //   break;
      // case PlatformEnum.instagram:
        // TODO: Handle this case.
        // break;
      case TwitterAccount:
        return PlatformEnum.twitter;
    }

    return PlatformEnum.twitter;

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.18,
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search contact"
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        //todo search
                      },
                      icon: Icon(Icons.search)
                  )
                ],
              ),
            ),


            SizedBox(
              height: size.height * 0.8,
              width: size.width,
              child: FutureBuilder<List<UserAbstract>>(
                future: context.read<AppState>().twitterFriends,
                builder: (context,snapshot){
                  if (snapshot.connectionState == ConnectionState.done)
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                          return FriendListTile(
                              username: snapshot.data!.elementAt(index).userName,
                            onTap: (){
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context)=> ChatDetailsScreen(
                                        thread: MessageThread(
                                            list: [],//todo function in appstate to find if messages exist with the ids
                                            tag: _checkFriendType(snapshot.data!.elementAt(index))
                                        )
                                    )
                                    )
                                );
                            },
                          );
                        });
                  return const Center(child: CircularProgressIndicator(),);
                },

              ),
            )
          ],
        )
        )
    );
  }
}
