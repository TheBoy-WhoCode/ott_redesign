// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../widgets/custom_app_bar.dart';

// class HomeScreen extends StatefulHookConsumerWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
// late ScrollController _scrollController;


//   @override
//   void initState() {
//    _scrollController = ScrollController()
//       ..addListener(() {
       
        
//       //  context.read<SubjectBloc>()<AppBarCubit>().setOffset(_scrollController.offset);
//       });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: PreferredSize(
//         preferredSize: Size(screenSize.width, 50),
//         child: CustomAppBar(
//           scrollOffset: scrollOffset as double,
//         ),
//       ),
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: const [
//           SliverToBoxAdapter(
//             child: ContentHeader(
//               featuredContent: sintelContent,
//             ),
//           ),
//           SliverPadding(
//             padding: EdgeInsets.only(top: 20),
//             sliver: SliverToBoxAdapter(
//               child: Previews(
//                   key: PageStorageKey("previews"),
//                   title: "Previews",
//                   contentList: previews),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: ContentList(
//                 key: PageStorageKey("mylist"),
//                 title: "My List",
//                 contentList: myList),
//           ),
//           SliverToBoxAdapter(
//             child: ContentList(
//                 key: PageStorageKey("orginals"),
//                 title: "Netflix Orginals",
//                 contentList: originals,
//                 isOriginals: true),
//           ),
//           SliverPadding(
//             padding: EdgeInsets.only(bottom: 20),
//             sliver: SliverToBoxAdapter(
//               child: ContentList(
//                   key: PageStorageKey("trending"),
//                   title: "Trending",
//                   contentList: trending),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // class HomeScreen extends HookConsumerWidget {
// //   const HomeScreen({Key? key}) : super(key: key);
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final Size screenSize = MediaQuery.of(context).size;
// //     final scrollOffset = ref.watch(appBarProvider);
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: PreferredSize(
// //         preferredSize: Size(screenSize.width, 50),
// //         child: CustomAppBar(
// //           scrollOffset: scrollOffset as double,
// //         ),
// //       ),
// //       body: CustomScrollView(
// //         controller: _scrollController,
// //         slivers: const [
// //           SliverToBoxAdapter(
// //             child: ContentHeader(
// //               featuredContent: sintelContent,
// //             ),
// //           ),
// //           SliverPadding(
// //             padding: EdgeInsets.only(top: 20),
// //             sliver: SliverToBoxAdapter(
// //               child: Previews(
// //                   key: PageStorageKey("previews"),
// //                   title: "Previews",
// //                   contentList: previews),
// //             ),
// //           ),
// //           SliverToBoxAdapter(
// //             child: ContentList(
// //                 key: PageStorageKey("mylist"),
// //                 title: "My List",
// //                 contentList: myList),
// //           ),
// //           SliverToBoxAdapter(
// //             child: ContentList(
// //                 key: PageStorageKey("orginals"),
// //                 title: "Netflix Orginals",
// //                 contentList: originals,
// //                 isOriginals: true),
// //           ),
// //           SliverPadding(
// //             padding: EdgeInsets.only(bottom: 20),
// //             sliver: SliverToBoxAdapter(
// //               child: ContentList(
// //                   key: PageStorageKey("trending"),
// //                   title: "Trending",
// //                   contentList: trending),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
