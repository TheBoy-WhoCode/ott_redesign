import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../providers/nav_provider.dart';

ScrollController useScrollControllerForAnimation(
  AnimationController animationController,
) {
  return use(ScrollerHook(
    animationController: animationController,
  ));
}

class ScrollerHook extends Hook<ScrollController> {
  final AnimationController animationController;
  const ScrollerHook({
    required this.animationController,
  });

  @override
  _ScrollerHookState createState() => _ScrollerHookState();
}

class _ScrollerHookState extends HookState<ScrollController, ScrollerHook> {
  final _scrollController = ScrollController();
  

  @override
  void initHook() {
    super.initHook();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          hook.animationController.forward();
          break;
        case ScrollDirection.reverse:
          hook.animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  ScrollController build(BuildContext context) => _scrollController;

  @override
  void dispose() => _scrollController.dispose();
}
