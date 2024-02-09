import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/intro/widget/button.dart';
import '../controller/intro_controller.dart';
import '../state/intro_state.dart';
import 'package:get_it/get_it.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = IntroController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<IntroController>()) {
      GetIt.I.unregister<IntroController>();
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
      child: BlocListener<IntroController, IntroState>(
        listener: (context, state) {},
        child: BlocBuilder<IntroController, IntroState>(
          builder: (context, state) {
            final bloc = context.read<IntroController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    IntroController controller,
    IntroState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  List<Map<String, dynamic>> intructionItems = [
                    {
                      "photo":
                          "https://img.freepik.com/free-vector/online-groceries-concept-illustration_114360-2272.jpg?w=826&t=st=1706686200~exp=1706686800~hmac=f179a932947569f5b68c3a4778e45365262b138215d5459ec80057657a2ef109",
                      "title": "Belanja Puas Pasti Cashback",
                      "description":
                          "gak usah khawatir , pasti dapat cashback!",
                    },
                    {
                      "photo":
                          "https://img.freepik.com/free-vector/flat-online-shopping-concept_52683-63899.jpg?w=826&t=st=1706686170~exp=1706686770~hmac=1133cf20f006ff723269bde13fb7aa8bd9b7316491adf6681c1f78f7f17f0b1b",
                      "title": "Belanja hemat tanpa batas",
                      "description": "Puas belanja dengan hemat tanpa batas!",
                    },
                    {
                      "photo":
                          "https://img.freepik.com/free-vector/grocery-promotion-concept-illustration_114360-23152.jpg?w=826&t=st=1706686257~exp=1706686857~hmac=89b9893083d81f9d6f7fe73ace96bd976b23658c7d9931560f511b83ca1cd9d0",
                      "title": "Belanja cerdas, nikmati diskon",
                      "description":
                          "Raih keuntungan dengan nikmati diskon menarik!",
                    },
                  ];

                  return Column(
                    children: [
                      Expanded(
                        child: CarouselSlider(
                          carouselController: controller.carouselController,
                          options: CarouselOptions(
                            height: 400,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              controller.currentIndex = index;
                              controller.updateState();
                            },
                          ),
                          items: intructionItems.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                double screenWidth =
                                    MediaQuery.of(context).size.width;
                                double finalFontSizeTitle = (screenWidth * 0.08)
                                    .clamp(double.minPositive, 30.0);
                                double finalFontSizeDescription =
                                    (screenWidth * 0.04)
                                        .clamp(double.minPositive, 15.0);
                                return Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 300,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              item["photo"],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(item["title"],
                                        style: TextStyle(
                                          fontSize: finalFontSizeTitle,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(item["description"],
                                        style: TextStyle(
                                          fontSize: finalFontSizeDescription,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: intructionItems.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => controller.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? primaryColor
                                          : primaryColor.withOpacity(
                                              0.6,
                                            ))
                                      .withOpacity(
                                          controller.currentIndex == entry.key
                                              ? 0.9
                                              : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                height: 50,
                                child: QButtonLocal(
                                    label: "Sign In",
                                    onPressed: () => controller.login())),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                                height: 50,
                                child: QButtonLocal(
                                  label: "Register",
                                  onPressed: () => controller.login(),
                                  color: disabledColor,
                                )),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
