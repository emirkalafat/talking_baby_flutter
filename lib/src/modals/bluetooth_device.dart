class BluetoothDevice {
  final String name;
  final String address;

  BluetoothDevice({required this.name, required this.address});
}

enum ToyType { unknown, rocket }

class BluetoothToy extends BluetoothDevice {
  final ToyType type;
  final bool isConnected;
  final int batteryLevel;

  BluetoothToy(
      {required super.name,
      required super.address,
      required this.type,
      required this.isConnected,
      required this.batteryLevel});
}
