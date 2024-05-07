import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/VideoPlayer/videoplayer_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerController>(
      init: VideoPlayerController(),
      builder: (controller) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller.ytController,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            title: const Text('Youtube Player'),
          ),
          body: ListView(
            children: [
              player,
            ],
          ),
        ),
      ),
    );
  }
}
