import 'package:scholar_chat/utils/my_Strings.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(json) {
    return Message(json[kMessage], json['id']);
  }
}
