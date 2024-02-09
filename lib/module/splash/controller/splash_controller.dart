import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:injectable/injectable.dart';

@singleton
class SplashController extends Cubit<SplashState> implements IBlocBase {
  SplashController() : super(SplashState());

  @override
  void initState() {
    login();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  increment() {
    state.counter++;
    emit(state.copyWith());
  }

  login() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offAll(IntroView());
    });
  }
}
