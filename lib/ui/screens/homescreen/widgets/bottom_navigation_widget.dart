import 'package:flutter/material.dart';


class BottomNavigationWidget extends StatefulWidget {
  final Function onChanged;
  const BottomNavigationWidget({Key? key,
  required this.onChanged}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index){
        setState(() {
          current = index;
        });
        widget.onChanged(index);
      },
      currentIndex: current, items: [
      BottomNavigationBarItem(

          icon: Icon(Icons.chat_bubble_outline),
          label: "Chat"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.speaker_group),
          label: "Broadcast"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.speaker_group),
          label: "Stock"
      ),
    ],
    );
  }
}





