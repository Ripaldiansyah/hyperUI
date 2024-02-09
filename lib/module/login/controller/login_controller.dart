import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/db_service/db_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginController extends Cubit<LoginState> implements IBlocBase {
  LoginController() : super(LoginState());

  @override
  void initState() {
    state.email = DBService.get("email");
    state.password = DBService.get("password");
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

  back() {
    Get.back();
  }

  login() async {
    Get.offAll(MainNavigationView());
  }
}
