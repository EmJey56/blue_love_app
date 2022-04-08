import 'BaseModel.dart';

class MessageLog implements BaseModel<MessageLog> {
  @override
  final int? id;

  final String? text;
  final DateTime? date;

  MessageLog({
    this.id,
    this.text,
    this.date,
  });

  @override
  MessageLog fromMap(Map<String, dynamic> map) {
    return MessageLog(
      id: map["id"],
      text: map["text"],
      date: map["date"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "text": text,
      "date": date,
    };
  }

  @override
  set id(int? _id) => id = _id;
}
