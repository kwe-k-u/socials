import "package:flutter/material.dart";
import 'package:grouped_list/grouped_list.dart';
import 'package:socials/utils/models/general_message_models/message_abstract.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';


class ChatBodyWidget extends StatefulWidget {
  final MessageThread messageThread;
  const ChatBodyWidget({Key? key,
    required this.messageThread
  }) : super(key: key);

  @override
  _ChatBodyWidgetState createState() => _ChatBodyWidgetState();
}

class _ChatBodyWidgetState extends State<ChatBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return GroupedListView<MessageAbstract, DateTime>(
      elements: widget.messageThread.getMessages(),
      groupBy:(MessageAbstract element) => DateTime(
          element.dateSent.year, element.dateSent.month,element.dateSent.day),
      floatingHeader: true,
      reverse: true,
      groupHeaderBuilder: (message){
        return Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            color: Colors.amberAccent,
            child: Text(message.dateSent.toString()),
          ),
        );
      },
      itemBuilder: (context, MessageAbstract message){

        return Align(
          alignment: true ? Alignment.centerLeft : Alignment.centerRight,
          child: _ChatBubble(message: message.text, received: false),
        );
      },
      

    );
  }
}











class _ChatBubble extends StatelessWidget {
  final bool received;
  final String message;
  const _ChatBubble({
    Key? key,
    required this.message,
    required this.received,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
          maxWidth: size.width * 0.45,
          minWidth: size.width * 0.2,
          minHeight: size.height * 0.08
      ),
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        padding: EdgeInsets.all(12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: received ? Colors.grey[200] : Colors.blue[200],
        ),
        child: Text(message),
      );
  }
}

