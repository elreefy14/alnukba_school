// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoId;

//   const VideoPlayerScreen({Key? key, required this.videoId}) : super(key: key);

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: YoutubePlayerFlags(
        

//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//       ),
//       builder: (context, player) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Youtube Player'),
//         ),
//         body: ListView(
//           children: [
//             player,
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }