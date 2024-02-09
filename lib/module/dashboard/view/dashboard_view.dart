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
        Expanded(
          child: Container(
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
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.42)
                              .clamp(double.minPositive, 360),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ListProducts(
                            aspectRatio1: 1.0,
                            aspectRatio2: 1.4,
                            itemCount: state.products.length,
                            items: state.products,
                          ),
                        )
                      ],
                    )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  height: (MediaQuery.of(context).size.height * 0.41)
                      .clamp(double.minPositive, 342),
                  width: MediaQuery.of(context).size.width,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 30, right: 30, bottom: 15),
                              child: SearchField(onChange: (value) {}),
                            )),
                        const SizedBox(
                          height: 10,
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
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
