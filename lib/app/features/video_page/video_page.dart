import 'dart:math';

import 'package:beamer/beamer.dart';
import 'package:beamer_hooks_example/app/hooks/use_video_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VideoPage extends HookWidget {
  const VideoPage({Key? key, this.videoId}) : super(key: key);

  final String? videoId;

  @override
  Widget build(BuildContext context) {
    useVideoController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('VIDEO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (videoId != null)
              Text(
                'Doc: $videoId',
                style: Theme.of(context).textTheme.headline2,
              ),
            TextButton(
              onPressed: () {
                final nextVideoId = Random().nextInt(230);

                Beamer.of(context).beamToNamed('/video/$nextVideoId');
              },
              child: const Text(
                'Next video',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
