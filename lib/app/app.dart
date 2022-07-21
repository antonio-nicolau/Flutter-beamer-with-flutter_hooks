import 'package:beamer_hooks_example/app/features/home/home_page.dart';
import 'package:beamer/beamer.dart';
import 'package:beamer_hooks_example/app/features/video_page/video_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Return either Widgets or BeamPages if more customization is needed
        '/': (context, state, data) => const HomePage(),
        '/video': (context, state, data) => const VideoPage(),
        '/video/:videoId': (context, state, data) {
          final videoId = state.pathParameters['videoId']!;

          return BeamPage(
            key: ValueKey('video-$videoId'),
            title: 'A Book #$videoId',
            popToNamed: '/',
            type: BeamPageType.scaleTransition,
            child: VideoPage(videoId: videoId),
          );
        }
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
