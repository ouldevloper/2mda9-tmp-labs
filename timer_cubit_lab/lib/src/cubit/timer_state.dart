part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {
  final int waitting;
  TimerInitial({required this.waitting});
}

class StartTimer extends TimerState {
  final int curVal;
  StartTimer({required this.curVal});
}

class PauseTimer extends TimerState {
  final int curVal;
  PauseTimer({required this.curVal});
}

class RestartTimer extends TimerState {
  final int curVal;
  RestartTimer({required this.curVal});
}

class StopTimer extends TimerState {}
