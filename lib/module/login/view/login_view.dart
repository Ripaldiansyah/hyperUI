import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hyper_ui/core.dart';

import 'package:get_it/get_it.dart';
import 'package:hyper_ui/service/db_service/db_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<LoginController>()) {
      GetIt.I.unregister<LoginController>();
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
      child: BlocListener<LoginController, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginController, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    LoginController controller,
    LoginState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: QButton(
                      label: "",
                      width: 80,
                      onPressed: () => controller.back(),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      icon: MdiIcons.arrowLeft,
                      iconColor: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Silakan masuk untuk mengelola transaksi",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                              "Optimalkan pengelolaan transaksi bisnis Anda dengan aplikasi kasir kami",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                QTextField(
                                  label: "Email",
                                  validator: Validator.email,
                                  value: controller.state.email,
                                  onChanged: (value) {
                                    controller.state.email = value;
                                    DBService.set("email", value);
                                  },
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                QTextField(
                                  label: "Password",
                                  obscure: true,
                                  validator: Validator.required,
                                  suffixIcon: Icons.lock,
                                  value: controller.state.password,
                                  onChanged: (value) {
                                    controller.state.password = value;
                                    DBService.set("password", value);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Divider(),
                          const SizedBox(
                            height: 50.0,
                          ),
                          QButton(
                            label: "Sign In",
                            onPressed: () {
                              bool isValid = formKey.currentState!.validate();
                              if (!isValid) {
                                return;
                              }
                              controller.login();
                            },
                          ),
                          const SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
