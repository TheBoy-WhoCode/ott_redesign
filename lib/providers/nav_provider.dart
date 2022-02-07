import 'package:flutter_riverpod/flutter_riverpod.dart';

final navIndexProvider = StateNotifierProvider((ref) => NavigationNotifier());

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);
  set value(int index) => state = index;
}
