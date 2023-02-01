import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: getBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _Logo(),
            SizedBox(height: 30.0,),
            _AppName(),
          ],
        ),
      ),
    );
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
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png');
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


