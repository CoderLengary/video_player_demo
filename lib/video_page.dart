

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {

  final String videoLocalPath;
  const VideoWidget({super.key, required this.videoLocalPath});



  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    started();

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void started() {
    _videoPlayerController =
        VideoPlayerController.asset(widget.videoLocalPath);
    _videoPlayerController.addListener(() {
      setState(() {

      });
    });
    _videoPlayerController.initialize().then((value) => {
    _videoPlayerController.play()

    });
  }

  Widget videoWidget(BuildContext context) {
    if (!_videoPlayerController.value.isInitialized) {
      return const Text('waiting for video to load');
    }
    return Column(
      children: [
        AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController),
        ),
        Text("Position=${_videoPlayerController.value.position}, duration=${_videoPlayerController.value.duration}")
      ],
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: videoWidget(context),
      ),
    );

  }
}