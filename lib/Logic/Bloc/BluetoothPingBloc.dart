import 'package:blue_love_app/Logic/Events/BluetoothEvents.dart';

import 'BaseBloc.dart';

class BluetoothBlocPing extends BaseBloc<Connected, Connected> {
  static final BluetoothBlocPing _instance = BluetoothBlocPing._internal();

  factory BluetoothBlocPing() {
    return _instance;
  }
  BluetoothBlocPing._internal();

  @override
  void mapEvent(event) {
    add(event);
  }
}
