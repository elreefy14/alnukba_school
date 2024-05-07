import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerController extends GetxController {
  late YoutubePlayerController ytController;

  @override
  void onInit() {
    super.onInit();
    ytController = YoutubePlayerController(
      initialVideoId: Get.arguments,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void onClose() {
    ytController.dispose();
    super.onClose();
  }
}
