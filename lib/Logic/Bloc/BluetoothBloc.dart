import 'package:blue_love_app/Logic/Events/BluetoothEvents.dart';

import 'BaseBloc.dart';

class BluetoothBloc extends BaseBloc<BandSate, BluetoothEvent> {
  static final BluetoothBloc _instance = BluetoothBloc._internal();

  factory BluetoothBloc() {
    return _instance;
  }
  BluetoothBloc._internal();

  @override
  void mapEvent(event) {
    if (event is ChangeColor) {
      add(ChangeMessage(event.color));
    } else if (event is SendMessage) {
      ///to do Push notification
      add(MessageSent(true));
    }
  }
}
