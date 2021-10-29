import 'dart:async';
import 'package:flutter/material.dart';

class Timerpage extends StatefulWidget {
  late int waitting = 10;
  Timerpage({Key? key, required this.waitting}) : super(key: key);

  @override
  _TimerpageState createState() => _TimerpageState();
}

class _TimerpageState extends State<Timerpage> with TickerProviderStateMixin {
  Timer? _timer;
  late bool isStarted = false;
  var curPercentage = 0.0;
  var curValue = 1;

  //@override

  @override
  void initState() {
    super.initState();
    curValue = widget.waitting;
    cacl();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  start(BuildContext context) {
    if (curValue > 0) {
      setState(() {
        isStarted = true;
      });
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      curValue -= 1;
      cacl();
      if (curValue <= 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Finished....")));
        stop();
      }
    });
  }

  stop() {
    _timer?.cancel();
    setState(() {
      isStarted = false;
    });
  }

  void cacl() {
    var val = curValue / widget.waitting;
    setState(() {
      curPercentage = val;
    });
  }

  void restart() {
    curValue = widget.waitting;
    cacl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Timer lab"),
          backgroundColor: Colors.pink.shade400,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  FloatingActionButton(
                    backgroundColor: Colors.blue.shade700,
                    onPressed: () {
                      print("sfdgas");
                      isStarted ? stop() : start(context);
                    },
                    child: IconButton(
                      icon: isStarted
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                      onPressed: () {
                        isStarted ? stop() : start(context);
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.height * 0.1,
                      margin: const EdgeInsets.all(10),
                      child: CircularProgressIndicator(
                        value: curPercentage,
                        backgroundColor: Colors.red[800],
                        strokeWidth: 8,
                      )),
                  const Padding(padding: EdgeInsets.all(10)),
                  FloatingActionButton(
                    backgroundColor: Colors.green.shade400,
                    onPressed: () {
                      restart();
                    },
                    child: IconButton(
                      icon: const Icon(Icons.restart_alt_rounded),
                      onPressed: () {
                        restart();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
