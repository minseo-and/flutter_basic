import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;

  const CustomVideoPlayer({Key? key, required this.video}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();

    initializeController();
  }

  initializeController() async {
    videoPlayerController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoPlayerController!.initialize();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (videoPlayerController == null) {
      return const CircularProgressIndicator();
    }

    return AspectRatio(
      aspectRatio: videoPlayerController!.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            videoPlayerController!,
          ),
          _Controls(
            onReversPressed: onReversedPressed,
            onPlayPressed: onPlayPressed,
            onForwardPressed: onForwardPressed,
            isPlaying: videoPlayerController!.value.isPlaying,
          ),
          Positioned(
            right: 0,
            child: IconButton(
              color: Colors.white,
                iconSize: 30.0,
                onPressed: () {},
                icon:
                const Icon(Icons.photo_camera_back)),
          )
        ],
      ),
    );
  }

  void onReversedPressed() {
    final currentPosition = videoPlayerController!.value.position;

    Duration position = const Duration();

    if(currentPosition.inSeconds > 3) {
      position = currentPosition - const Duration(seconds: 3);
    }

    videoPlayerController!.seekTo(position);
  }

  void onForwardPressed() {

  }

  void onPlayPressed() {
    setState(() {
      if(videoPlayerController!.value.isPlaying){
        videoPlayerController!.pause();
      }else {
        videoPlayerController!.play();
      }
    });

  }
}

class _Controls extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversPressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _Controls({Key? key, required this.onPlayPressed, required this.onReversPressed, required this.onForwardPressed, required this.isPlaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(onPressed: onReversPressed, iconData: Icons.rotate_left),
          renderIconButton(onPressed: onPlayPressed, iconData: isPlaying ? Icons.pause : Icons.play_arrow),
          renderIconButton(onPressed: onForwardPressed, iconData: Icons.rotate_right)
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return IconButton(
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {},
        icon: Icon(iconData));
  }
}
