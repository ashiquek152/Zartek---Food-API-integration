import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:zartek/app/modules/home/controllers/home_controller.dart';
import 'package:zartek/app/widgets/text_customized.dart';

class DetailsTileCustomContainer extends StatelessWidget {
  DetailsTileCustomContainer(
      {Key? key, required this.data, required this.index})
      : super(key: key);

  final CategoryDishes data;
  final int index;

  final homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                      TextCustomized(
                        fontSize: 16,
                        text: "${data.dishCalories!.round()} Calories",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextCustomized(
                    fontSize: 14,
                    text: data.dishDescription!,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black45,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 120,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () =>
                                controller.removeDishesFromList(data),
                            icon: const TextCustomized(
                              fontSize: 25,
                              text: "-",
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                          ),
                          TextCustomized(
                            fontSize: 16,
                            text: data.quantity == null
                                ? "0"
                                : data.quantity.toString(),
                            fontWeight: FontWeight.bold,
                            textColor: Colors.white,
                          ),
                          IconButton(
                            onPressed: () => controller.addDishesToList(data),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextCustomized(
                    fontSize: 16,
                    text: data.addonCat!.isNotEmpty
                        ? "Customizations available"
                        : "",
                    // fontWeight: FontWeight.bold,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/IndianDishes.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
