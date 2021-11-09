import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCub extends Cubit<TimerState> {
  final int waitInSec;
  int curVal;
  Timer? timer;
  bool isRun = false;
  TimerCub({required int waitting})
      : waitInSec = waitting,
        curVal = waitting,
        super(TimerInitial(waitting: waitting));
  static TimerCub get(BuildContext context) => BlocProvider.of(context);
  Future<void> startaction() async {
    emit(StartTimer(curVal: curVal));
    timer = Timer.periodic(const Duration(seconds: 1), (tmr) {
      if (curVal > 0) {
        curVal -= 1;
        isRun = true;
        emit(StartTimer(curVal: curVal));
      }
      if (curVal <= 0) {
        isRun = false;
        timer?.cancel();
        emit(TimerInitial(waitting: waitInSec));
      }
      //emit(StopTimer());
    });
  }

  Future<void> pauseaction() async {
    timer?.cancel();
    isRun = false;
    emit(PauseTimer(curVal: curVal));
  }

  Future<void> restartaction() async {
    curVal = waitInSec;
    isRun = false;
    //emit(RestartTimer(curVal: curVal));
    emit(TimerInitial(waitting: waitInSec));
  }

  Future<double> cacl() async {
    return (waitInSec * 10) - (curVal * 10);
  }
}
