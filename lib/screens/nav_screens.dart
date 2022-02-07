import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ott_redesign/providers/nav_provider.dart';
import 'package:ott_redesign/widgets/frosted_bottom_bar.dart';

class NavigationView extends ConsumerWidget {
  NavigationView({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentIndex = ref.watch(navIndexProvider);

    return Scaffold(
      body:
          Stack(children: [_screens[_currentIndex as int], FrostedBottomBar()]),
    );
  }
}
