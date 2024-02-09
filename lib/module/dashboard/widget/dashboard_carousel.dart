// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardCarousel extends StatelessWidget {
  const DashboardCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      List<Map<String, dynamic>> itemPromo = [
        {
          "photo":
              "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
          "title": "Diskon 30%",
          "description": "Spesial Menu Hari ini"
        },
        {
          "photo":
              "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
          "title": "Diskon 10%",
          "description": "Makan Asik bareng keluarga"
        },
        {
          "photo":
              "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
          "title": "Diskon 20%",
          "description": "Setiap Pembelian Salad"
        },
        {
          "photo":
              "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
          "title": "Diskon 5%",
          "description": "Dengan Kartu Kredit BCA"
        },
        {
          "photo":
              "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
          "title": "Gratis Thai Tea",
          "description": "Setiap Pembelian minimal 100rb"
        },
      ];

      return CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height *
              0.20.clamp(double.minPositive, 250),
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: itemPromo.map((promo) {
          return Builder(
            builder: (BuildContext context) {
              double screenWidth = MediaQuery.of(context).size.width;
              double screenHeight = MediaQuery.of(context).size.height;

              double smallestFontSize =
                  screenWidth < screenHeight ? screenWidth : screenHeight;

              double finalFontSizeTitle =
                  (smallestFontSize * 0.06).clamp(double.minPositive, 60.0);
              double finalFontSizeDescription =
                  (smallestFontSize * 0.02).clamp(double.minPositive, 20.0);

              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      promo["photo"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20.0,
                      top: 0.0,
                      bottom: 0.0,
                      right: 0.0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              promo["title"],
                              style: GoogleFonts.oswald(
                                fontSize: finalFontSizeTitle,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              promo["description"],
                              style: GoogleFonts.oswald(
                                fontSize: finalFontSizeDescription,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      );
    });
  }
}
