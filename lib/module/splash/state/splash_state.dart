
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.freezed.dart';

@unfreezed
class SplashState with _$SplashState {
  factory SplashState({
    @Default(0) int counter,
  }) = _SplashState;
}
    
    