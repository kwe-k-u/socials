import 'package:flutter/material.dart';


class ChatTile extends StatelessWidget {
  final String username;
  final String message;
  final void Function() onTap;

  const ChatTile({
    Key? key,
    required this.username,
    required this.message,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onTap,
        leading: Hero(
          tag: "",
          child: Icon(Icons.account_balance),
        ),
        title: _TitleWidget( username: username,),
        subtitle: Text(message),
        trailing: _DateWidget(),
      ),
    );
  }
}





class _TitleWidget extends StatelessWidget {
  final String username;

  const _TitleWidget({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(username),
        _Label()
      ],
    );
  }

  Widget _Label(){
    return Container(); //todo round tag
  }


}






class _DateWidget extends StatelessWidget {
  const _DateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Fri"),
        Text("3:30 PM")
      ],
    );
  }
}

