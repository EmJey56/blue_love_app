import 'BaseModel.dart';

class Diaries implements BaseModel<Diaries> {
  @override
  final int? id;

  final String? name;
  final String? content;

  Diaries({
    this.id,
    this.name,
    this.content,
  });

  @override
  Diaries fromMap(Map<String, dynamic> map) {
    return Diaries(
      id: map["id"],
      name: map["name"],
      content: map["content"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "content": content,
    };
  }

  @override
  set id(int? _id) => id = _id;
}
