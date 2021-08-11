import "package:flutter/material.dart";


class ChatBodyWidget extends StatefulWidget {
  const ChatBodyWidget({Key? key}) : super(key: key);

  @override
  _ChatBodyWidgetState createState() => _ChatBodyWidgetState();
}

class _ChatBodyWidgetState extends State<ChatBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        if (index %2 == 0){
          return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _ChatBubble(message: "Charle wusop", received: index %2 == 0),

              ]
          );
        } else{
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              _ChatBubble(message: "Everything Cool", received: index %2 == 0),
        ]
          );
        }
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
    return Container(
        padding: EdgeInsets.all(12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: received ? Colors.grey[200] : Colors.blue[200],
        ),
        child: Text(message),
      );
  }
}

