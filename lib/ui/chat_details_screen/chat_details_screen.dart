import 'package:flutter/material.dart';
import 'package:socials/ui/chat_details_screen/widgets/chat_body_widget.dart';
import 'package:socials/ui/chat_details_screen/widgets/chat_text_field.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({Key? key}) : super(key: key);

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
                      Text("Facebook",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
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
                child: ChatBodyWidget(),
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
}




