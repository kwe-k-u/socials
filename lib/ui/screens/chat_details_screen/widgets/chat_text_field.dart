import "package:flutter/material.dart";


class ChatTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;

  const ChatTextField({
    Key? key,
    this.controller,
    this.hintText
  }) : super(key: key);

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText ?? "Type your message..."
      ),
    );
  }
}
