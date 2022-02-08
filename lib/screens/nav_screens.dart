import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ott_redesign/screens/home_screen.dart';
import '../utils/icons_utils.dart';
import '../widgets/floating_bottom_bar/floating_bottom_bar.dart';

class NavigationView extends StatefulHookConsumerWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavigationViewState();
}

class _NavigationViewState extends ConsumerState<NavigationView>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink
  ];

  final List<Widget> _screens = [
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<SizedBox> _items = icons
      .map(
        (title, icon) => MapEntry(
          title,
          SizedBox(
            height: 65,
            width: 50,
            child: Center(
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      )
      .values
      .toList();

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5
        ? Colors.black
        : Colors.white;
    return Scaffold(
      body: BottomBar(
        child: TabBar(
            indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            controller: tabController,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    color: currentPage == 0
                        ? colors[0]
                        : currentPage == 1
                            ? colors[1]
                            : currentPage == 2
                                ? colors[2]
                                : currentPage == 3
                                    ? colors[3]
                                    : currentPage == 4
                                        ? colors[4]
                                        : unselectedColor,
                    width: 4),
                insets: const EdgeInsets.fromLTRB(16, 0, 16, 8)),
            tabs: _items),
        fit: StackFit.expand,
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: false,
        width: MediaQuery.of(context).size.width * 0.8,
        start: 2,
        end: 0,
        bottom: 10,
        alignment: Alignment.bottomCenter,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: _screens,
        ),
      ),
    );
  }
}
// class NavigationView extends HookConsumerWidget {
//   NavigationView({Key? key}) : super(key: key);

//   final List<Widget> _screens = [
//     HomeScreen(),
//     const Scaffold(),
//     const Scaffold(),
//     const Scaffold(),
//     const Scaffold(),
//   ];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _currentIndex = ref.watch(navIndexProvider);

//     return Scaffold(
//         body: Stack(
//       children: [
//         _screens[_currentIndex as int],
//         FrostedBottomBar(),
//       ],
//     ));
//   }
// }
