import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_lab/provider/timerprovider.dart';
import 'package:timer_lab/src/timer_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Timerprovider>(
        create: (_) => Timerprovider(waitting: 10),
        child: MaterialApp(
          title: 'Timer TMP lab',
          home: Timerpage(waitting: 10),
        ));
  }
}
