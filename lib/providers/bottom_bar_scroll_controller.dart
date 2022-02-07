import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarScrollControllerNotifier extends StateNotifier {
  BottomBarScrollControllerNotifier(state) : super(state);
  ScrollController scrollController = ScrollController();
}
