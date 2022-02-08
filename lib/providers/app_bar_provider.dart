import 'package:flutter_riverpod/flutter_riverpod.dart';

final appBarProvider = StateNotifierProvider((ref) => AppBarNotifier());
class AppBarNotifier extends StateNotifier<double> {
  AppBarNotifier() : super(0);
  void setOffset(double offset) => state = offset;
}
