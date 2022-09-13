import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:zartek/app/widgets/text_customized.dart';

class CheckoutController extends GetxController {
  int totalDishes = 0;
  double totalAmount = 0;

  getTotal({required List<CategoryDishes> categoryDishes}) {
    totalDishes = 0;
    totalAmount = 0;

    for (var i = 0; i < categoryDishes.length; i++) {
      totalDishes = totalDishes + categoryDishes[i].quantity!;
      totalAmount = totalAmount +
          categoryDishes[i].quantity! * categoryDishes[i].dishPrice!;
      print(totalAmount);
    }
    update();
  }

  orderPlaced() {
    Get.dialog(
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: Get.height * 0.2,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 50,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(),
                    child: TextCustomized(fontSize: 25, text: "Order Placed"),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
