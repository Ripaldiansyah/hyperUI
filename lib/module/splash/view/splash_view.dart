import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import '../controller/splash_controller.dart';
import '../state/splash_state.dart';
import 'package:get_it/get_it.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = SplashController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<SplashController>()) {
      GetIt.I.unregister<SplashController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<SplashController, SplashState>(
        listener: (context, state) {},
        child: BlocBuilder<SplashController, SplashState>(
          builder: (context, state) {
            final bloc = context.read<SplashController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    SplashController controller,
    SplashState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon/logo.png",
                width: 170.0,
                height: 170.0,
                fit: BoxFit.fill,
              ).animate().fadeIn(duration: 2000.ms),
              const SizedBox(
                height: 150,
              ),
              Text("POS BY KELOMPOK 4").animate().fadeIn(duration: 2000.ms),
            ],
          ),
        ),
      ),
    );
  }
}
