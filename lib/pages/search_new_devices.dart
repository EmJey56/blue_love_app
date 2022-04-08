import 'dart:async';

import 'package:blue_love_app/Logic/Bloc/BluetoothBloc.dart';
import 'package:blue_love_app/Logic/Bloc/BluetoothPingBloc.dart';
import 'package:blue_love_app/Logic/Events/BluetoothEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class NewDevicesPageState {
  static final NewDevicesPageState _instance = NewDevicesPageState._internal();

  factory NewDevicesPageState() {
    return _instance;
  }
  NewDevicesPageState._internal() {
    init();
  }

  late String title;
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  _addDeviceTolist(final BluetoothDevice device) {
    if (device.id.id == "D5:06:23:0C:EE:AF") {
      connect(device);
    }
  }

  StreamController<List<int>> streamController = StreamController<List<int>>();

  BluetoothDevice? dev;
  List<BluetoothService>? services;
  late StreamSubscription<BluetoothDeviceState>? _stateSubscription;

  void init() {
    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    flutterBlue.startScan();
  }

  void connect(BluetoothDevice device) async {
    try {
      await device.connect(autoConnect: false);
    } catch (ex) {}
    _stateSubscription = device.state.listen((state) async {
      if (state == BluetoothDeviceState.disconnected) {
        BluetoothBlocPing().addSink(Connected(false));
        await _stateSubscription!.cancel();
        _stateSubscription = null;
      }

      if (state == BluetoothDeviceState.connected) {
        BluetoothBlocPing().addSink(Connected(true));

        dev = device;

        device.discoverServices().then((value) {
          services = value;
          if (services != null) {
            services?[2].characteristics[0].setNotifyValue(true);
            services?[2].characteristics[0].value.listen((event) {
              BluetoothBloc()
                  .addSink(ChangeColor(event.isNotEmpty ? event[0] : 0));
            });
            services?[3].characteristics[0].write([5, 0, 0, 0]);
            services?[3].characteristics[0].setNotifyValue(true);
            services?[3].characteristics[0].value.listen((event) {
              BluetoothBloc()
                  .addSink(SendMessage(event.isNotEmpty ? event[0] : 0));
            });
          }
        });
      }
    });
  }

  static colorDefine(int code) {
    switch (code) {
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.red;
        break;
      case 3:
        return Colors.blueAccent;
        break;
      case 4:
        return Colors.yellow;
        break;
      case 5:
        return Colors.purple;
        break;
      case 6:
        return Colors.lightBlue;
        break;
      case 7:
        return Colors.white;
        break;
    }
  }

  // @override
  // Widget build(BuildContext context) => Scaffold(
  //       appBar: AppBar(
  //         title: Text("New Devices"),
  //         centerTitle: true,
  //         backgroundColor: Colors.green,
  //       ),
  //     );
}
