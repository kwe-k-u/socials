import 'package:flutter/material.dart';
import 'package:socials/ui/screens/chat_details_screen/widgets/chat_body_widget.dart';
import 'package:socials/ui/screens/chat_details_screen/widgets/chat_text_field.dart';
import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';
import 'package:provider/provider.dart';


class ChatDetailsScreen extends StatefulWidget {
  final MessageThread thread;
  const ChatDetailsScreen({
    Key? key,
    required this.thread
  }) : super(key: key);

  @override
  _ChatDetailsScreenState createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                BackButton(),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/5.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Kwame Okran",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text(widget.thread.tag.toString().split(".")[1],style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

        body: Container(
          height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                color: Colors.blue,
                height: size.height * 0.75,
                child: ChatBodyWidget(
                  userId: getPlatformId(widget.thread.tag),
                  messageThread: widget.thread,
                ),
              ),
              Row(
                children: [
                  IconButton(

                    icon: Icon(Icons.add),
                    onPressed: (){

                    },
                  ),
                  Flexible(
                    child: ChatTextField(),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: (){

                    },
                  )
                ],
              )
            ],
          ),
        )
        )
    );
  }



  String getPlatformId(PlatformEnum platform){
    switch (platform){

      case PlatformEnum.facebook:
        // TODO: Handle this case.
      case PlatformEnum.snapchat:
        // TODO: Handle this case.
      case PlatformEnum.instagram:
        // TODO: Handle this case.
      case PlatformEnum.twitter:
        return context.read<AppState>().twitter!.userId!;
    }
  }
}




