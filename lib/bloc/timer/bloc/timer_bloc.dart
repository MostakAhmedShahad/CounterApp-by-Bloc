// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'timer_event.dart';
// part 'timer_state.dart';

// class TimerBloc extends Bloc<TimerEvent, TimerState> {
//   TimerBloc() : super(TimerInitial()) {
//     on<TimerEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'timer_event.dart';
import 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  List<StopWatchRecord> _laps = [];

  TimerBloc() : super(TimerInitial()) {
    _stopWatchTimer.rawTime.listen((value) {
      add(UpdateTime(value));
    });

    _stopWatchTimer.records.listen((value) {
      _laps = value;
      add(UpdateTime(_stopWatchTimer.rawTime.value));
    });

    on<StartTimer>((event, emit) => _stopWatchTimer.onStartTimer());
    on<StopTimer>((event, emit) => _stopWatchTimer.onStopTimer());
    on<ResetTimer>((event, emit) {
      _stopWatchTimer.onResetTimer();
      _laps.clear();
    });
    on<AddLap>((event, emit) => _stopWatchTimer.onAddLap());
    on<UpdateTime>((event, emit) => emit(TimerRunning(event.rawTime, _laps)));
  }

  @override
  Future<void> close() async {
    await _stopWatchTimer.dispose();
    return super.close();
  }
}
