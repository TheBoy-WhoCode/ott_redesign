import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ott_redesign/providers/nav_provider.dart';
import 'package:ott_redesign/utils/icons_utils.dart';

class NavigationView extends ConsumerWidget {
  NavigationView({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<BottomNavigationBarItem> _items = icons
      .map(
        (title, icon) => MapEntry(
          title,
          BottomNavigationBarItem(
              icon: Icon(
                icon,
                size: 30,
              ),
              label: title),
        ),
      )
      .values
      .toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentIndex = ref.watch(navIndexProvider);

    return Scaffold(
      body: _screens[_currentIndex as int],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: _items,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11,
        onTap: (index) => {ref.read(navIndexProvider.notifier).value = index},
      ),
    );
  }
}
