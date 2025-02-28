import 'package:app_10/bloc/timer/bloc/timer_bloc.dart';
import 'package:app_10/bloc/timer/bloc/timer_event.dart';
import 'package:app_10/bloc/timer/bloc/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text("BLoC Timer App")),
        body: BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            String displayTime = "00:00:00";
            List<StopWatchRecord> laps = [];

            if (state is TimerRunning) {
              displayTime = StopWatchTimer.getDisplayTime(state.rawTime);
              laps = state.laps;
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(displayTime, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),

                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Lap ${index + 1}: ${laps[index].displayTime}"),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.read<TimerBloc>().add(StartTimer()),
                        child: const Text("Start"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => context.read<TimerBloc>().add(StopTimer()),
                        child: const Text("Stop"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => context.read<TimerBloc>().add(ResetTimer()),
                        child: const Text("Reset"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => context.read<TimerBloc>().add(AddLap()),
                        child: const Text("Lap"),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'bloc/timer_bloc.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';

// void main() {
//   runApp(BlocProvider(
//     create: (_) => TimerBloc(),
//     child: TimerApp(),
//   ));
// }

// class TimerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text("BLoC Timer App")),
//         body: BlocBuilder<TimerBloc, TimerState>(
//           builder: (context, state) {
//             String displayTime = "00:00:00";
//             List<StopWatchRecord> laps = [];

//             if (state is TimerRunning) {
//               displayTime = StopWatchTimer.getDisplayTime(state.rawTime);
//               laps = state.laps;
//             }

//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(displayTime, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),

//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: laps.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text("Lap ${index + 1}: ${laps[index].displayTime}"),
//                       );
//                     },
//                   ),
//                 ),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => context.read<TimerBloc>().add(StartTimer()),
//                       child: const Text("Start"),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () => context.read<TimerBloc>().add(StopTimer()),
//                       child: const Text("Stop"),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () => context.read<TimerBloc>().add(ResetTimer()),
//                       child: const Text("Reset"),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () => context.read<TimerBloc>().add(AddLap()),
//                       child: const Text("Lap"),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
