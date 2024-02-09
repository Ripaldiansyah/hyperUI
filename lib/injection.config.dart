// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'module/dashboard/controller/dashboard_controller.dart' as _i3;
import 'module/intro/controller/intro_controller.dart' as _i4;
import 'module/login/controller/login_controller.dart' as _i5;
import 'module/main_navigation/controller/main_navigation_controller.dart'
    as _i6;
import 'module/order/controller/order_controller.dart' as _i7;
import 'module/profile/controller/profile_controller.dart' as _i8;
import 'module/register/controller/register_controller.dart' as _i9;
import 'module/splash/controller/splash_controller.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DashboardController>(_i3.DashboardController());
    gh.singleton<_i4.IntroController>(_i4.IntroController());
    gh.singleton<_i5.LoginController>(_i5.LoginController());
    gh.singleton<_i6.MainNavigationController>(_i6.MainNavigationController());
    gh.singleton<_i7.OrderController>(_i7.OrderController());
    gh.singleton<_i8.ProfileController>(_i8.ProfileController());
    gh.singleton<_i9.RegisterController>(_i9.RegisterController());
    gh.singleton<_i10.SplashController>(_i10.SplashController());
    return this;
  }
}
