import 'package:flutter_riverpod/flutter_riverpod.dart';

final navIndexProvider = StateNotifierProvider((ref) {
  return NavIndex();
});

class NavIndex extends StateNotifier<int> {
  NavIndex() : super(0);
  void increment() => state++;
}
