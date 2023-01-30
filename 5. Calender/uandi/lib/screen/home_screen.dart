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
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: const [_TopPart(), _BottomPart()],
            ),
          ),
        ));
  }
}

class _TopPart extends StatelessWidget {
  const _TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'U&I',
            style: TextStyle(
                color: Colors.white, fontFamily: 'parisienne', fontSize: 80.0),
          ),
          Column(
            children: [
              const Text(
                '우리 처음 만난날',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sunflower',
                    fontSize: 30.0),
              ),
              const Text(
                '2021.12.27',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sunflower',
                    fontSize: 20.0),
              ),
            ],
          ),
          IconButton(
              iconSize: 60.0,
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          height: 300.0,
                          child: ,
                        ),
                      );
                    });
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          const Text(
            'D+1',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 50.0,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset('assets/images/middle_image.png'),
    );
  }
}
