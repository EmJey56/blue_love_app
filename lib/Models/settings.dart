import 'BaseModel.dart';
import 'message.dart';
import 'messageLog.dart';

class Settings implements BaseModel<Settings> {
  @override
  final int? id;

  final String? firebaseToken;
  final List<Message>? messages;
  final List<MessageLog>? messageLog;

  Settings({
    this.id,
    this.firebaseToken,
    this.messages,
    this.messageLog,
  });

  @override
  Settings fromMap(Map<String, dynamic> map) {
    return Settings(
      id: map["id"],
      firebaseToken: map["firebaseToken"],
      messages: map["messages"],
      messageLog: map["messageLog"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firebaseToken": firebaseToken,
      "messages": messages,
      "messageLog": messageLog
    };
  }

  @override
  set id(int? _id) => id = _id;
}
