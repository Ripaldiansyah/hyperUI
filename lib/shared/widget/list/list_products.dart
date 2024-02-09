// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core.dart';

class ListProducts extends StatelessWidget {
  final double aspectRatio1;
  final double aspectRatio2;
  final int? itemCount;
  final items;
  const ListProducts({
    Key? key,
    required this.aspectRatio1,
    required this.aspectRatio2,
    this.itemCount,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 200).floor();
    crossAxisCount = crossAxisCount < 2 ? 2 : crossAxisCount;
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: aspectRatio1 / aspectRatio2,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: itemCount,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item["photo"] ??
                            "https://i.ibb.co/S32HNjD/no-image.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        8.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item["product_name"],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item["category"],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Rp. ${item["price"]}",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: (MediaQuery.of(context).size.width * 0.09)
                                .clamp(double.minPositive, 50),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.add,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          )
              .animate()
              .moveX(
                begin: index % 2 == 0 ? -100 : 100,
                duration: ((index * 300) + 250).ms,
              )
              .fadeIn(
                duration: ((index * 300) + 250).ms,
              ),
        );
      },
    );
  }
}
