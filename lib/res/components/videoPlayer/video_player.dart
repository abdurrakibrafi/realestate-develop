import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final File? videoFile;
  final String? videoUrl;
  final bool isEdit;

  const VideoPlayerWidget({
    super.key,
    this.videoFile,
    required this.isEdit,
    this.videoUrl,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      _controller = VideoPlayerController.network(widget.videoUrl!)
        ..initialize().then((_) {
          setState(() {});
        });
    } else {
      _controller = VideoPlayerController.file(widget.videoFile!)
        ..initialize().then((_) {
          setState(() {});
        });
    }

    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
