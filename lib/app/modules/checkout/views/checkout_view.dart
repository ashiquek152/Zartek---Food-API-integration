import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:zartek/app/modules/checkout/widgets/cart_items.dart';
import 'package:zartek/app/modules/home/controllers/home_controller.dart';
import 'package:zartek/app/widgets/text_customized.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  CheckoutView({Key? key, this.selectedItems}) : super(key: key);

  final List<CategoryDishes>? selectedItems;
  final checkoutController = Get.put(CheckoutController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    checkoutController.getTotal(categoryDishes: selectedItems!);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
            size: 35,
          ),
        ),
        backgroundColor: Colors.white,
        title: const TextCustomized(
          fontSize: 25,
          text: "Order Summary",
          textColor: Colors.black45,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.08,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 63, 5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextCustomized(
                          fontSize: 20,
                          text:
                              "${checkoutController.totalDishes} DISHES - ${selectedItems!.length} ITEMS",
                          textColor: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = selectedItems![index];
                          return CartItemsList(data: data, index: index);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: selectedItems!.length),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextCustomized(
                          fontSize: 25,
                          text: "Total Amount",
                          fontWeight: FontWeight.bold,
                        ),
                        TextCustomized(
                          fontSize: 22,
                          text: "INR ${controller.totalAmount.toString()}",
                          textColor: Colors.green,
                        )
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: Get.height * 0.15),
                    SizedBox(
                      width: Get.width,
                      height: Get.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color.fromARGB(255, 3, 63, 5),
                        ),
                        onPressed: () async {
                          await controller.orderPlaced();
                          await Future.delayed(const Duration(seconds: 1), () {
                            Get.back();
                          });
                         await homeController.clearAll();
                        },
                        child: const TextCustomized(
                          fontSize: 25,
                          text: "Place order",
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
