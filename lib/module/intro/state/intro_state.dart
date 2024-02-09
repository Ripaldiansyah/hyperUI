import 'package:freezed_annotation/freezed_annotation.dart';
part 'intro_state.freezed.dart';

@unfreezed
class IntroState with _$IntroState {
  factory IntroState({
    @Default(0) int selectedIndex,
  }) = _IntroState;
}
