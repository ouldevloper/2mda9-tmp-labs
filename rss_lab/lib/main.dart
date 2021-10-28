import 'package:flutter/material.dart';
import 'package:rss_lab/rssfeeds.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IT Jobs ...',
      home: Rssfeeds(), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
