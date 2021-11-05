part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {
  const TimerEvent();
}

class StartTimer extends TimerEvent {
  const StartTimer();
}

class PauseTimer extends TimerEvent {
  const PauseTimer();
}

class StopTimer extends TimerEvent {
  const StopTimer();
}

class RestartTimer extends TimerEvent {
  const RestartTimer();
}

class Ticked extends TimerEvent {
  final double curVal;
  const Ticked({required this.curVal});
}
