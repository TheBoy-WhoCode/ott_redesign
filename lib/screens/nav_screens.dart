import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ott_redesign/providers/nav_provider.dart';

class NavigationView extends ConsumerWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentIndex = ref.watch(navIndexProvider);

    return Scaffold();
  }
}
