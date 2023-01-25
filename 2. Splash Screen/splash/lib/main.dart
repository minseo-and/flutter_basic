import 'package:flutter/material.dart';
import 'package:splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const MaterialApp(
              home: Splash(),
            );
          }
          else {
            return MaterialApp(
              theme: ThemeData(
                primaryColor: Colors.blue
              ),
            );
          }
        });
  }
}

