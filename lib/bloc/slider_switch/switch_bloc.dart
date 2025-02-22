import 'package:app_10/bloc/slider_switch/switch_event.dart';
import 'package:app_10/bloc/slider_switch/switch_state.dart';
 
import 'package:flutter_bloc/flutter_bloc.dart';
 

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDisableNotification>(_OnOff) ;
     on<SliderMove>(_slider) ;

     

  }

  void _OnOff(EnableOrDisableNotification event, Emitter<SwitchState>emit ){

   emit(state.copywith(isSwitch: !state.isSwitch));


  }

  void _slider(SliderMove event,Emitter <SwitchState>emit){
    emit(state.copywith(sliderValue: event.sliderValue));


  }
    

  
}