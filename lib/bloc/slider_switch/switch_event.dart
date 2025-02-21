 

import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {

  const SwitchEvent();
  @override
  List<Object> get props =>[];

  get isSwitch => null;

}

class EnableOrDisableNotification extends SwitchEvent{}
class SliderMove extends SwitchEvent{
  double sliderValue;
  SliderMove({required this.sliderValue});

  @override
  List<Object> get props =>[sliderValue];
}