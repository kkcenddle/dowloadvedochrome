// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:mechinetest/test.dart';
//
// import 'package:video_player/video_player.dart';
//
// import 'login.dart';
//
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//
//   final FlickManager flickManager=FlickManager(videoPlayerController: VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
//   String? uid;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyHomePage()),
//                       (route) => false);
//             },
//             // onPressed: (){
//             //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
//             // },
//           )
//         ],
//       ),
//       body: AspectRatio(
//         aspectRatio: 16/9,
//         child: FlickVideoPlayer(flickManager: flickManager),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     uid = FirebaseAuth.instance.currentUser!.uid;
//   }
// }
//
//
//



import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:video_player/video_player.dart';

import 'app_drawer.dart';
import 'login.dart';

class MyHomePage extends StatelessWidget {
  final String videoUrl =
      'https://drive.google.com/uc?export=download&id=1KlzVyh7R4LvGALTxkXDa-9tCPeH-YLux';

  Future<File> downloadVideo(String videoUrl) async {
    final cacheManager = DefaultCacheManager();
    return await cacheManager.getSingleFile(videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Video Downloader'),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final videoFile = await downloadVideo(videoUrl);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(videoFile: videoFile),
              ),
            );
          },
          child: Text('Download video'),
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final File videoFile;

  VideoPlayerScreen({required this.videoFile});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late FlickManager flickManager;

  @override
  void initState() {

    super.initState();
    disableScreenshots();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    flickManager = FlickManager(
      videoPlayerController: _controller,
    );
  }

  Future<void> disableScreenshots() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: AppDrawer(),
            appBar: AppBar(
        title: Text('Home'),
        actions: [
        ],
      ),
      body: Center(
        child: FlickVideoPlayer(
          flickManager: flickManager,
        ),
      ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    flickManager.dispose();
  }
}