import 'dart:async';

import "package:flutter/material.dart";

class Timerprovider with ChangeNotifier {
  Timer? _timer;
  late bool isStarted = false;
  var curPercentage = 1.0;
  var curValue = 1;
  final int waitting;

  //@override

  Timerprovider({required this.waitting}) {
    curValue = waitting;
    cacl();
  }

  start(BuildContext context) {
    if (curValue > 0) {
      isStarted = true;
      notifyListeners();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (curValue > 0) {
        curValue -= 1;
        cacl();
      }
      if (curValue <= 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Finished....")));
        stop();
      }
    });
  }

  stop() {
    _timer?.cancel();
    isStarted = false;
    notifyListeners();
  }

  void cacl() {
    var val = (curValue / (waitting)) * 100;
    curPercentage = val;
    notifyListeners();
  }

  void restart() {
    curValue = waitting;
    curPercentage = 1.0;
    cacl();
    isStarted = false;
    notifyListeners();
  }
}
