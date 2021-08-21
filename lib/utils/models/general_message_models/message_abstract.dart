

abstract class MessageAbstract{
  String  text;
  String  id;
  String  senderId;
  String  recipientId;
  DateTime  dateSent;

  MessageAbstract({
    required this.text,
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.dateSent
  });

}