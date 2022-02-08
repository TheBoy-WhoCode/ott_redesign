import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ott_redesign/providers/app_bar_provider.dart';

import '../constants/utils.dart';

class CustomAppBar extends HookConsumerWidget {
  final double scrollOffset;
  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollOffset = ref.watch(appBarProvider);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black
          .withOpacity(((scrollOffset as double) / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset("assets/netflix_logo0.png"),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    title: "TV Shows",
                    onTap: () {
                      logger.d("TV Shows");
                    },
                  ),
                  _AppBarButton(
                    title: "Movies",
                    onTap: () {
                      logger.d("Movies");
                    },
                  ),
                  _AppBarButton(
                    title: "My List",
                    onTap: () {
                      logger.d("Movies");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
