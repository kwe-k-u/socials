import "package:flutter/material.dart";
import 'package:socials/ui/chat_details_screen/chat_details_screen.dart';
import 'package:socials/ui/chat_list_screen/widgets/chat_tile.dart';


class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index){
        return Divider();
      },
        itemBuilder: (context,index){
          return ChatTile(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> ChatDetailsScreen()
                  )
              );
            },
              username: "username",
              message: "message"
          );
    }, itemCount: 20,);
  }
}
