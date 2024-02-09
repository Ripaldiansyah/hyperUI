import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/login/view/login_view.dart';
import 'package:hyper_ui/state_util.dart';
import '../state/intro_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class IntroController extends Cubit<IntroState> implements IBlocBase {
  IntroController() : super(IntroState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  updateState() {
    emit(state.copyWith());
  }

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  login() async {
    Get.to(LoginView());
  }
}
