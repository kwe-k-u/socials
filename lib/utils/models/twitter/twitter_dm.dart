
import 'package:socials/utils/models/general_message_models/message_abstract.dart';

class TwitterDM extends MessageAbstract{
  String type;
  Map<String, dynamic> messageCreate;

  TwitterDM({
    required this.type,
    required String id,
    required DateTime dateSent,
    required String recipientId,
    required String senderId,
    required this.messageCreate

}) : super(
       text : messageCreate["message_data"]["text"],
      id : id,
      senderId : senderId,
      recipientId : recipientId,
      dateSent : dateSent
  );

  String get sourceAppId => messageCreate["source_app_id"];
  List<String> get mentions => messageCreate["message_data"]["entities"]["user_mentions"];
  List<String> get symbols => messageCreate["message_data"]["entities"]["symbols"];
  List<String> get hashtags => messageCreate["message_data"]["entities"]["hashtags"];
  List<String> get urls => messageCreate["message_data"]["entities"]["urls"];



  factory TwitterDM.fromJson(Map<String, dynamic> map){
    return TwitterDM(
        type: map["type"],
        id: map["id"],
        messageCreate: map["message_create"],
        dateSent: DateTime.fromMillisecondsSinceEpoch(int.parse(map["created_timestamp"])),
        senderId: map["message_create"]["sender_id"],
        recipientId: map["message_create"]["target"]["recipient_id"]
    );
  }

}