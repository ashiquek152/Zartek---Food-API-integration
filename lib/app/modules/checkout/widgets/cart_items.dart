import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:zartek/app/widgets/text_customized.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.data, required this.index});

  final CategoryDishes data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.lens_sharp,
            color: index.isEven ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustomized(
                  fontSize: 20,
                  text: data.dishName!,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustomized(
                      fontSize: 16,
                      text: "INR ${data.dishPrice}",
                      fontWeight: FontWeight.bold,
                      textColor: Colors.black45,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextCustomized(
                  fontSize: 14,
                  text:
                      "${(data.dishCalories! * data.quantity!).toInt()} Calories",
                  fontWeight: FontWeight.bold,
                  textColor: Colors.black45,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const TextCustomized(
                      fontSize: 25,
                      text: "-",
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                    ),
                  ),
                  TextCustomized(
                    fontSize: 16,
                    text:
                        data.quantity == null ? "0" : data.quantity.toString(),
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          TextCustomized(
            fontSize: 16,
            text: "INR ${data.quantity! * data.dishPrice!}",
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
