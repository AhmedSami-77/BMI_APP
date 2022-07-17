import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 40),
          textTheme: const TextTheme(
            headline1: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          )),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
