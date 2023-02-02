import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video/component/custom_video_player.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: video == null ? randomEmpty() : randerVideo()
    );
  }

  Widget randerVideo() {
    return Center(
      child: CustomVideoPlayer(
        video: video!,
        onNewVideoPressed: onNewVideoPressed,
      ),
    );
  }

  Widget randomEmpty() {
    return Container(
      decoration: getBoxDecoration(),
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Logo(
              onTap: onLogoTap,
            ),
            SizedBox(height: 30.0,),
            _AppName(),
          ],
        ),
      ),
    );
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (video != null) {
      setState(() {
        this.video = video;
      });
    }
  }

  void onLogoTap() async{
    final video = await ImagePicker().pickVideo(
        source: ImageSource.gallery
    );

    if(video != null){
      setState(() {
        this.video = video;
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff2a3a7c),
            Color(0xff000118)
          ],
        )
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/images/logo.png')
    );
  }
}

class _AppName extends StatelessWidget {
  const _AppName({Key? key}) : super(key: key);

  final textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('VIDEO',
            style: textStyle),
        Text('PLAYER',
            style: textStyle.copyWith(
                fontWeight: FontWeight.w700
            ))
      ],
    );
  }
}


