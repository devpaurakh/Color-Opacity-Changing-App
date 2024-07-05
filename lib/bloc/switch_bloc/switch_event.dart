import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  
  const SwitchEvent();
  @override
  List<Object> get props => [];
}

class enableOrDisableSwitch extends SwitchEvent{}

// ignore: must_be_immutable
class slider extends SwitchEvent{
  double sliderValue;

  slider( {required this.sliderValue}); 

  @override
  List<Object> get props => [sliderValue];
  }

