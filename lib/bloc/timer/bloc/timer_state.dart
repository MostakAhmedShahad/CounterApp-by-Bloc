// part of 'timer_bloc.dart';

// sealed class TimerState extends Equatable {
//   const TimerState();
  
//   @override
//   List<Object> get props => [];
// }

// final class TimerInitial extends TimerState {}


import 'package:stop_watch_timer/stop_watch_timer.dart';

abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerRunning extends TimerState {
  final int rawTime;
  final List<StopWatchRecord> laps;

  TimerRunning(this.rawTime, this.laps);
}
