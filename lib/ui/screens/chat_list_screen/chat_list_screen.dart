import "package:flutter/material.dart";
import 'package:socials/ui/screens/chat_list_screen/widgets/chat_tile.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:provider/provider.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';


class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<AppState>().twitterMessages,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<MessageThread> messages = snapshot.data as List<
                  MessageThread>;
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  return ChatTile(
                    thread: messages.elementAt(index),
                  );
                }, itemCount: messages.length,
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No messages to display"),
                  ElevatedButton(
                    child: Text("Reload"),
                    onPressed: (){
                      setState(() {

                      });
                    },
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
    });
  }
}
