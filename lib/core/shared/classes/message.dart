import 'message_type.dart';

class Message {
  String? message;
  MessageType messageOwner;

  Message({required this.message, required this.messageOwner});
}
