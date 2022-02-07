import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/scroller_hooks.dart';


class HomeScreen extends HookConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final hookAnimation = useAnimationController(
      duration: const Duration(milliseconds: 500), initialValue: 0);
  late final hookScroller = useScrollControllerForAnimation(hookAnimation);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          hookAnimation.reverse();
        },
        onDoubleTap: () {
          hookAnimation.forward();
        },
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            controller: hookScroller,
            children: List.generate(
              20,
              (index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: FadeTransition(
                      opacity: hookAnimation,
                      child: ScaleTransition(
                        scale: hookAnimation,
                        child: const FlutterLogo(
                          size: 500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
