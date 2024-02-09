import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/order_controller.dart';
import '../state/order_state.dart';
import 'package:get_it/get_it.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  OrderController controller = OrderController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<OrderController>()) {
      GetIt.I.unregister<OrderController>();
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
      child: BlocListener<OrderController, OrderState>(
        listener: (context, state) {},
        child: BlocBuilder<OrderController, OrderState>(
          builder: (context, state) {
            final bloc = context.read<OrderController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    OrderController controller,
    OrderState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.blueGrey[900],
              ),
              suffixIcon: Container(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.sort,
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
