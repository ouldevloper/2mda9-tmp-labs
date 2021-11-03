import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_lab/provider/timerprovider.dart';

class TimerWidget extends StatelessWidget {
  TimerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("this is timer widget page");
    var timer = Provider.of<Timerprovider>(context, listen: false);
    return Container(
        height: 200, //MediaQuery.of(context).size.height * 0.1,
        width: 200, //MediaQuery.of(context).size.height * 0.1,
        margin: const EdgeInsets.all(0),
        child: Column(children: [
          CircularProgressIndicator(
            value: timer.isStarted ? null : timer.curPercentage,
            color: !timer.isStarted ? Colors.white : null,
            //backgroundColor: Colors.red[800],
            strokeWidth: 4,
          ),
          Text(
            "${(timer.curPercentage - 100) * -1 > 0 ? (timer.curPercentage - 100) * -1 : 0.0} %",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ]));
  }
}
