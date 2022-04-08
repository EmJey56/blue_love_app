import 'BaseModel.dart';

class Mac implements BaseModel<Mac> {
  @override
  final int? id;

  final String? mine;
  final String? pair;

  Mac({
    this.id,
    this.mine,
    this.pair,
  });

  @override
  Mac fromMap(Map<String, dynamic> map) {
    return Mac(
      id: map["id"],
      mine: map["mine"],
      pair: map["pair"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "mine": mine,
      "pair": pair,
    };
  }

  @override
  set id(int? _id) => id = _id;
}
