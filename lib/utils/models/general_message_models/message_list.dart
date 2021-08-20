import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/models/general_message_models/message_abstract.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';



///Grouping of all the conversations on all platforms as values with keys being String addition of
///sender and recipient ID
class MessageList{
  late Map<String, MessageThread> _messages = {};


  Future<void> addList(List<MessageAbstract> data, PlatformEnum tag)async{
    data.forEach((element) {

      //if no combination of sender and recipient id exists in the map, start a new thread
      if (this._messages.containsKey(element.recipientId+element.senderId)){
        this._messages[element.recipientId+element.senderId]!.addMessage(element);
      } else if (this._messages.containsKey(element.senderId+element.recipientId)){
        this._messages[element.senderId+element.recipientId]!.addMessage(element);
      } else
        this._messages[element.senderId+element.recipientId] = new MessageThread(
            list: [element], tag: tag);

      });
        }



  

  List<MessageThread> _getMessages(PlatformEnum? platform){
    if (platform == null)
      return this._messages.values as List<MessageThread>;
    List<MessageThread> list = [];
    for (MessageThread thread in _messages.values){
      if (thread.tag == platform)
        list.add(thread);
    }
    return list;
  }

  List<MessageThread> getFacebookMessages(){
    return _getMessages(PlatformEnum.facebook);
  }

  List<MessageThread> getInstagramMessages(){
    return _getMessages(PlatformEnum.instagram);
  }

  List<MessageThread> getSnapchatMessages(){
    return _getMessages(PlatformEnum.snapchat);
  }

  List<MessageThread> getTwitterMessages() {
    return _getMessages(PlatformEnum.twitter);
  }
}