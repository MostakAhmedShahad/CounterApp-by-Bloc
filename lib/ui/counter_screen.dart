import 'package:app_10/bloc/counter/counter_bloc.dart';
import 'package:app_10/bloc/counter/counter_event.dart';
import 'package:app_10/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return  Center(
              child: Text(
          state.counter.toString(),
            style: TextStyle(fontSize: 50),
          )) ;
            },
          ),
         
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () { 
                    context.read<CounterBloc>().add(IncrementCounter());
                    
                  },
                  child: Text('Increment')),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () { 
                    
                  },
                  child: Text('Dcrement')),
            ],
          )
        ],
      ),
    );
  }
}
