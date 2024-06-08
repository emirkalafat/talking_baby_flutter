import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:riverpod/riverpod.dart';

final bluetoothProvider = Provider((ref) => FlutterBluePlus());

final bluetoothRepositoryProvider = Provider<BluetoothRepository>(
    (ref) => BluetoothRepository(flutterBluePlus: ref.read(bluetoothProvider)));

class BluetoothRepository {
  final FlutterBluePlus _flutterBluePlus;

  BluetoothRepository({
    required FlutterBluePlus flutterBluePlus,
  }) : _flutterBluePlus = flutterBluePlus;
}
