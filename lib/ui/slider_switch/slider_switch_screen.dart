import 'package:app_10/bloc/slider_switch/switch_bloc.dart';
import 'package:app_10/bloc/slider_switch/switch_event.dart';
import 'package:app_10/bloc/slider_switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderSwitchScreen extends StatefulWidget {
  const SliderSwitchScreen({super.key});

  @override
  State<SliderSwitchScreen> createState() => _SliderSwitchScreenState();
}

class _SliderSwitchScreenState extends State<SliderSwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                 BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(value: state.isSwitch, onChanged: (newValue) {
                      context.read<SwitchBloc>().add(EnableOrDisableNotification());
                    });
                  }
                ),

                 
               
                
              ],
            ),
            SizedBox(height: 20,),

            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
              height: 200,
              width: double.infinity,
              color: Colors.red.withOpacity(state.sliderValue),
              
              
            ) ;
              },
            ),
            
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return  Slider(value: state.sliderValue, onChanged: (value){
                  context.read<SwitchBloc>().add(SliderMove(sliderValue: value));
                  
                }) ;
              },
            )
        
           
          ],
        ),
      ),
    );
  }
}












//  BlocBuilder<SwitchBloc, SwitchState>(
//                   builder: (context, state) {
//                     return Switch(value: state.isSwitch, onChanged: (newValue) {
//                       context.read<SwitchBloc>().add(EnableOrDisableNotification());
//                     });
//                   }
//                 ),