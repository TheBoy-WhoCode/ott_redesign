import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/nav_provider.dart';
import '../utils/icons_utils.dart';

class FrostedBottomBar extends ConsumerWidget {
  FrostedBottomBar({Key? key}) : super(key: key);

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
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Opacity(
            opacity: 0.8,
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              items: _items,
              currentIndex: _currentIndex as int,
              selectedItemColor: Colors.white,
              selectedFontSize: 11,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11,
              onTap: (index) =>
                  ref.read(navIndexProvider.notifier).value = index,
            ),
          ),
        ),
      ),
    );
  }
}
