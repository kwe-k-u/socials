
class TwitterDM{
  String type;
  String id;
  DateTime createdTimestamp;
  Map<String, dynamic> messageCreate;

  TwitterDM({
    required this.type,
    required this.id,
    required this.createdTimestamp,
    required this.messageCreate

});

  String get text => messageCreate["message_data"]["text"];
  String get senderId => messageCreate["sender_id"];
  String get sourceAppId => messageCreate["source_app_id"];
  String get recipientId => messageCreate["recipient_id"];
  List<String> get mentions => messageCreate["message_data"]["entities"]["user_mentions"];
  List<String> get symbols => messageCreate["message_data"]["entities"]["symbols"];
  List<String> get hashtags => messageCreate["message_data"]["entities"]["hashtags"];
  List<String> get urls => messageCreate["message_data"]["entities"]["urls"];



  factory TwitterDM.fromJson(Map<String, dynamic> map){
    print( DateTime.fromMillisecondsSinceEpoch(int.parse(map["created_timestamp"])).toString());

    return TwitterDM(
        type: map["type"],
        id: map["id"],
        messageCreate: map["message_create"],
        createdTimestamp: DateTime.fromMillisecondsSinceEpoch(int.parse(map["created_timestamp"]))
    );
  }

}