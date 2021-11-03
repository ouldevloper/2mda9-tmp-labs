import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_lab/provider/timerprovider.dart';
import 'package:timer_lab/provider/timerwidget.dart';

// ignore: must_be_immutable
class Timerpage extends StatelessWidget {
  final int waitting;
  Timerpage({Key? key, required this.waitting}) : super(key: key);
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var timerprovider = Provider.of<Timerprovider>(context, listen: true);
    // ignore: avoid_print
    print("called  ${counter++}");
    // ignore: avoid_print
    print("Proverder ${timerprovider.curPercentage}");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider Timer lab"),
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
                      timerprovider.isStarted
                          ? timerprovider.stop()
                          : timerprovider.start(context);
                    },
                    child: IconButton(
                      icon: timerprovider.isStarted
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                      onPressed: () {
                        timerprovider.isStarted
                            ? timerprovider.stop()
                            : timerprovider.start(context);
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  TimerWidget(),
                  const Padding(padding: EdgeInsets.all(10)),
                  FloatingActionButton(
                    backgroundColor: Colors.green.shade400,
                    onPressed: () {
                      timerprovider.restart();
                    },
                    child: IconButton(
                      icon: const Icon(Icons.restart_alt_rounded),
                      onPressed: () {
                        timerprovider.restart();
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
