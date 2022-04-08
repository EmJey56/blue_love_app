import 'dart:typed_data';

import 'BaseModel.dart';
import 'diaries.dart';
import 'mac.dart';

class User implements BaseModel<User> {
  @override
  final int? id;

  final String? username;
  final String? name;
  final String? lastName;
  final String? token;
  final String? pushNotificationToken;
  final List<Mac>? macAddress;
  final Uint8List? avatar;
  final List<Diaries>? diaries;

  User({
    this.id,
    this.username,
    this.name,
    this.lastName,
    this.token,
    this.pushNotificationToken,
    this.macAddress,
    this.avatar,
    this.diaries,
  });

  @override // json to object
  User fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      username: map["username"],
      name: map["name"],
      lastName: map["lastName"],
      token: map["token"],
      pushNotificationToken: map["pushNotificationToken"],
      macAddress: map["macAddress"],
      avatar: map["avatar"],
      diaries: map["diaries"],
    );
  }

  @override // object to json
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": username,
      "lastName": lastName,
      "token": token,
      "pushNotificationToken": pushNotificationToken,
      "macAddress": macAddress,
      "avatar": avatar,
      "diaries": diaries,
    };
  }

  @override
  set id(int? _id) => id = _id;
}
