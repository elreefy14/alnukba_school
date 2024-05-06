import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_textfield.dart';
import 'package:getx_skeleton/app/modules/cart/views/video_player_screen.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../components/no_data.dart';
import '../../../components/screen_title.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
// Replace with your actual path

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final yt = YoutubeExplode();
  List<Video> videos = [];

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  fetchVideos() async {
    var playlistId = 'PLKjDe6hXX8kWKTUJtRZp6fFRbrf04yY_Y';
    await for (var video in yt.playlists.getVideos(playlistId)) {
      setState(() {
        videos.add(video);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video List'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videos[index].title),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         VideoPlayerScreen(videos[index].id.value),
              //   ),
              // );
              //navigate to video player screen using getx
              print(videos[index].id.value);
              print('\n');
              print(videos[index].id.value);

              Get.to(() => VideoPlayerScreen(videoId: videos[index].id.value));            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    yt.close();
    super.dispose();
  }
}
