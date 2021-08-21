import 'package:flutter/material.dart';
import 'package:socials/ui/screens/chat_details_screen/chat_details_screen.dart';
import 'package:socials/ui/widgets/platform_icon_widget.dart';
import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';
import 'package:provider/provider.dart';

class ChatTile extends StatelessWidget {
  final MessageThread thread;

  const ChatTile({
    Key? key,
    required this.thread
  }) : super(key: key);

  String _determineId(BuildContext context){
    switch(thread.tag){

      case PlatformEnum.facebook:
        // TODO: Handle this case.
        break;
      case PlatformEnum.snapchat:
        // TODO: Handle this case.
        break;
      case PlatformEnum.instagram:
        // TODO: Handle this case.
        break;
      case PlatformEnum.twitter:
        return context.read<AppState>().twitter!.userId == thread.first.senderId ?  thread.first.recipientId : thread.first.senderId;

    }
    return "";
  }
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
          id: _determineId(context),
          tag: thread.tag,
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





class _TitleWidget extends StatefulWidget {
  final String id;
  final PlatformEnum tag;

  const _TitleWidget({
    required this.id,
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  __TitleWidgetState createState() => __TitleWidgetState();
}

class __TitleWidgetState extends State<_TitleWidget> {

  Future<String> _getName() async{
    String v;
    switch (widget.tag){
      case PlatformEnum.facebook:
      // TODO: Handle this case.
      case PlatformEnum.snapchat:
      // TODO: Handle this case.
      case PlatformEnum.instagram:
      // TODO: Handle this case.
      case PlatformEnum.twitter:
        v = await context.read<AppState>().twitter!.getUserById(widget.id);
    }
    return v;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getName(),
      initialData: "Retrieving name...",
        builder: (context,snapshot){
        return Row(
          children: [
            Text(snapshot.data as String, overflow: TextOverflow.fade,),
            PlatformIconWidget(platform: this.widget.tag)
          ],
        );
      });
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

