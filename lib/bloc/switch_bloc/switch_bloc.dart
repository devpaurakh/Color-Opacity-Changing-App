import 'package:bloc/bloc.dart';
import 'package:coloropacityapp/bloc/switch_bloc/switch_event.dart';
import 'package:coloropacityapp/bloc/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<enableOrDisableSwitch>(_enableOrDisableSwitch);
    on<slider>(_sliderFunction);
  }

  void _enableOrDisableSwitch(
      enableOrDisableSwitch event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitched: !state.isSwitched)); 
  }


  void _sliderFunction(
      slider event, Emitter<SwitchState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue)); 
  }
}
