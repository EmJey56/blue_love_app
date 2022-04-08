class BluetoothEvent {}

class ChangeColor extends BluetoothEvent {
  final int color;

  ChangeColor(this.color);
}

class Connected extends BluetoothEvent {
  final bool status;

  Connected(this.status);
}

class SendMessage extends BluetoothEvent {
  final int color;

  SendMessage(this.color);
}

class BandSate {}

class ChangeMessage extends BandSate {
  final int color;

  ChangeMessage(this.color);
}

class MessageSent extends BandSate {
  final bool status;

  MessageSent(this.status);
}
