import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer? timer;
  final int waitting;
  int curtime = 0;
  TimerBloc({required int waitting})
      : waitting = waitting,
        curtime = waitting,
        super(InitTimerState(0.0));
  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    print(curtime);
    print(event);
    if (event is StartTimer) {
      yield* _StartTimerToState(event);
    } else if (event is PauseTimer) {
      yield* _PauseTimerToState(event);
    } else if (event is StopTimer) {
      yield* _StopTimerToState(event);
    } else if (event is RestartTimer) {
      yield* _ResetTimerToState(event);
    } else if (event is Ticked) {
      yield* _TickedToState(event);
    }
  }

  double calcVal() {
    return (((waitting - curtime) * 100) / waitting);
  }

  Stream<TimerState> _StartTimerToState(StartTimer start) async* {
    if (curtime > 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (_timer) {
        curtime -= 1;
        add(Ticked(curVal: calcVal()));
        if (curtime <= 0) {
          timer?.cancel();
          add(RestartTimer());
        }
      });
    }
  }

  Stream<TimerState> _PauseTimerToState(PauseTimer pause) async* {
    if (pause is PauseTimer) {
      timer?.cancel();
      yield PauseTimerState(calcVal());
    }
  }

  Stream<TimerState> _StopTimerToState(StopTimer stop) async* {
    if (stop is StopTimerState) {
      timer?.cancel();
      yield StopTimerState(calcVal());
    }
  }

  Stream<TimerState> _ResetTimerToState(RestartTimer reset) async* {
    if (reset is RestartTimer) {
      curtime = waitting;
      timer?.cancel();
      yield RestartTimerState(0);
    }
  }

  Stream<TimerState> _TickedToState(Ticked ticked) async* {
    if (ticked is Ticked) yield StartTimerState(calcVal());
  }
}
