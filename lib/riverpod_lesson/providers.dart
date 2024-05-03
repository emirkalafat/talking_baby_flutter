import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = Provider<String>((ref) {
  return 'Ankara';
});

final weatherProvider = Provider<String>((ref) {
  final city = ref.watch(cityProvider);
  return 'Sunny in $city';
});

final counterProvider = StateNotifierProvider.autoDispose<Counter, int>((ref) {
  return Counter(ref);
});

class Counter extends StateNotifier<int> {
  Counter(this.ref) : super(0);

  final Ref ref;

  void increment() {
    // Counter can use the "ref" to read other providers
    print('#################');
    print('Counter is $state');
    state++;
    print('Counter is $state');
  }
}
