


import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/models/general_message_models/message_abstract.dart';

///Grouping of messages in a single conversation
class MessageThread{
  final PlatformEnum tag;
  late _Node _first;
  late _Node _last;
  int size = 0;


  MessageAbstract get first => this._first.message;

  MessageAbstract get last => this._last.message;

  MessageThread({required List<MessageAbstract> list, required this.tag}) {
    //linking nodes if list is not empty
    if (list.isNotEmpty) {
      _first = _Node(
          prev: null,
          next: null,
          message: list.first
      );

      _Node _current = _first;

      for (int index = 1; index < list.length; index++) {
       _Node _newNode = _Node(
           prev: _current,
           next: null,
           message: list[index]);

       _current.next = _newNode;
       _current = _newNode;

      }
      _last = _current;
    }
    size = list.length;
  }

  void addMessage(MessageAbstract message) {
    _Node node = _Node(
        prev: null,
        next: null,
        message: message
    );
    if (this.size == 0)
      _first = node;
    else {
      this._last.next = node;
      node.prev = this._last;
      this._last = node;
    }
  }
  List<MessageAbstract> getMessages({bool newest = true}){
    if (newest)
      return _getMessagesNewToOld();
    return _getMessagesOldToNew();
  }


  List<MessageAbstract> _getMessagesNewToOld(){
    List<MessageAbstract> _messages = [];
    _Node? current = _first;
    do{
      _messages.add(current!.message);
      current = current.next;
    }
    while(current!.next != null);
    return _messages;
  }


  List<MessageAbstract> _getMessagesOldToNew(){
    List<MessageAbstract> _messages = [];
    _Node? current = _last;
    do{
      _messages.add(current!.message);
      current = current.prev;
    }
    while(current!.prev != null);
    return _messages;
  }
}



class _Node{
  _Node? prev;
  _Node? next;
 final MessageAbstract message;

  _Node({
    required this.prev,
    required this.next,
    required this.message
});

}