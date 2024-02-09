import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/dashboard/widget/dashboard_carousel.dart';
import 'package:hyper_ui/shared/widget/form/search_field/search_field.dart';
import 'package:hyper_ui/shared/widget/list/list_products.dart';
import '../controller/dashboard_controller.dart';
import '../state/dashboard_state.dart';
import 'package:get_it/get_it.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = DashboardController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<DashboardController>()) {
      GetIt.I.unregister<DashboardController>();
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
      child: BlocListener<DashboardController, DashboardState>(
        listener: (context, state) {},
        child: BlocBuilder<DashboardController, DashboardState>(
          builder: (context, state) {
            final bloc = context.read<DashboardController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DashboardController controller,
    DashboardState state,
  ) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          // height: MediaQuery.of(context).size.height *
          //     0.32.clamp(double.minPositive, 300),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Positioned(
                  left: 30,
                  right: 30,
                  top: MediaQuery.of(context).size.height * 0.12,
                  child: Container(
                      child: Column(
                    children: [
                      const SizedBox(height: 400),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListProducts(
                            aspectRatio1: 1.0, aspectRatio2: 1.0, items: null),
                      )
                    ],
                  )),
                ),
              ),
              Container(
                height: 360,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 30.0, bottom: 30.0, top: 15),
                    child: Column(
                      children: [
                        Container(child: SearchField(onChange: (value) {})),
                        const SizedBox(
                          height: 10.0,
                        ),
                        DashboardCarousel(),
                        QCategoryPicker(
                          items: [
                            {
                              "label": "Main Course",
                              "value": "Main Course",
                            },
                            {
                              "label": "Drink",
                              "value": "Drink",
                            },
                            {
                              "label": "Snack",
                              "value": "Snack",
                            },
                            {
                              "label": "Dessert",
                              "value": "Dessert",
                            }
                          ],
                          validator: Validator.required,
                          onChanged: (index, label, value, item) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
