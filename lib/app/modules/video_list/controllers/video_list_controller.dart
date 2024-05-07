import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoListController extends GetxController {
  final yt = YoutubeExplode();
  var videos = <Video>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

fetchVideos() async {
    var playlistId = 'PLKjDe6hXX8kWKTUJtRZp6fFRbrf04yY_Y';
    isLoading.value = true; // Set isLoading to true before fetching videos

    try {
      await for (var video in yt.playlists.getVideos(playlistId)) {
        videos.add(video);
      }
    } finally {
      isLoading.value = false; // Set isLoading to false after fetching videos
    }
  }

  @override
  void onClose() {
    yt.close();
    super.onClose();
  }
}
