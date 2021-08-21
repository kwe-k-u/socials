import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:socials/ui/chat_details_screen/chat_details_screen.dart';
import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';


class ChatTile extends StatelessWidget {
  final MessageThread thread;

  const ChatTile({
    Key? key,
    required this.thread
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => ChatDetailsScreen(thread: thread)
              )
          );
        },
        leading: Hero(
          tag: "",
          child: Icon(Icons.account_balance),
        ),
        title: _TitleWidget(
          tag: thread.tag,
          username: thread.last.id,
        ),//todo show the other person's name

        subtitle: Text(
          thread.last.text,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),

        trailing: _DateWidget(
          date: thread.last.dateSent
        ),
      ),
    );
  }
}





class _TitleWidget extends StatelessWidget {
  final String username;
  final PlatformEnum tag;

  const _TitleWidget({
    Key? key,
    required this.username,
    required this.tag,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(username, overflow: TextOverflow.fade,),
        _label()
      ],
    );
  }

  Widget _label(){
    switch (this.tag){

      case PlatformEnum.facebook:
        return Icon(Ionicons.logo_facebook);
      case PlatformEnum.snapchat:
        return Icon(Ionicons.logo_snapchat);
      case PlatformEnum.instagram:
        return Icon(Ionicons.logo_instagram);
      case PlatformEnum.twitter:
        return Icon(Ionicons.logo_twitter);
    }
  }


}






class _DateWidget extends StatelessWidget {
  final DateTime date;
  const _DateWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${date.day}/${date.month}"),
        Text("${date.hour}: ${date.minute}")
      ],
    );
  }
}

