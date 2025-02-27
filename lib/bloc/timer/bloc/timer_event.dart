// part of 'timer_bloc.dart';

// sealed class TimerEvent extends Equatable {
//   const TimerEvent();

//   @override
//   List<Object> get props => [];
// }


abstract class TimerEvent {}

class StartTimer extends TimerEvent {}
class StopTimer extends TimerEvent {}
class ResetTimer extends TimerEvent {}
class AddLap extends TimerEvent {}
class UpdateTime extends TimerEvent {
  final int rawTime;
  UpdateTime(this.rawTime);
}

