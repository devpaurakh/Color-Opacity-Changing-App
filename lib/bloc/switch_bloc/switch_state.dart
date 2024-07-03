import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitched;
  final double sliderValue;

  const SwitchState({
    this.isSwitched = false,
    this.sliderValue = 1.0,
  });

  SwitchState copyWith({bool? isSwitched, double? sliderValue}) {
    return SwitchState(
      isSwitched: isSwitched ?? this.isSwitched,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [isSwitched, sliderValue];
}
