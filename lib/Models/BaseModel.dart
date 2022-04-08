import 'dart:typed_data';

import 'User.dart';
import 'diaries.dart';
import 'mac.dart';
import 'message.dart';
import 'messageLog.dart';
import 'settings.dart';

abstract class BaseModel<TEntity> {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Entity.
  int? id;
  Map<String, dynamic> toMap();

  TEntity fromMap(Map<String, dynamic> map);

  static BaseModel? getType<TEntity>() {
    switch (TEntity) {
      case User:
        return User(
          id: 0,
          username: "",
          name: "",
          lastName: "",
          token: "",
          pushNotificationToken: "",
          macAddress: [],
          avatar: [] as Uint8List,
        );
      case Mac:
        return Mac(
          id: 0,
          mine: "",
          pair: "",
        );
      case Diaries:
        return Diaries(
          id: 0,
          name: "",
          content: "",
        );
      case Message:
        return Message(
          id: 0,
          color: "",
          text: "",
        );
      case Settings:
        return Settings(
          id: 0,
          firebaseToken: "",
          messages: [],
          messageLog: [],
        );

      case MessageLog:
        return MessageLog(
          id: 0,
          text: "",
          date: [] as DateTime,
        );
      default:
        return null;
    }
  }
}
