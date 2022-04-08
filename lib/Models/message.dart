import 'BaseModel.dart';

class Message implements BaseModel<Message> {
  @override
  final int? id;

  final String? color;
  final String? text;

  Message({
    this.id,
    this.color,
    this.text,
  });

  @override
  Message fromMap(Map<String, dynamic> map) {
    return Message(
      id: map["id"],
      color: map["color"],
      text: map["text"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "color": color,
      "text": text,
    };
  }

  @override
  set id(int? _id) => id = _id;
}
