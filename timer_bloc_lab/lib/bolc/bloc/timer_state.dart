part of 'timer_bloc.dart';

@immutable
abstract class TimerState {
  final bool isRunning;
  final double curVal;

  TimerState(this.isRunning, this.curVal);
}

class InitTimerState extends TimerState {
  InitTimerState(double curVal) : super(false, 0.0);
}

class StartTimerState extends TimerState {
  StartTimerState(double curVal) : super(true, curVal);
}

class PauseTimerState extends TimerState {
  PauseTimerState(double curVal) : super(false, curVal);
}

class StopTimerState extends TimerState {
  StopTimerState(double curVal) : super(false, curVal);
}

class RestartTimerState extends TimerState {
  RestartTimerState(double curVal) : super(false, curVal);
}
