import 'package:flutter/material.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:zartek/app/widgets/text_customized.dart';

class DishDetailsTile extends StatelessWidget {
  const DishDetailsTile({
    super.key,
    required this.categoryDish,
  });

  final List<CategoryDishes> categoryDish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final data = categoryDish[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const TextCustomized(
                                      fontSize: 16,
                                      text: "30",
                                      fontWeight: FontWeight.bold,
                                      textColor: Colors.white,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const TextCustomized(
                                        fontSize: 25,
                                        text: "-",
                                        fontWeight: FontWeight.bold,
                                        textColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                             TextCustomized(
                              fontSize: 16,
                              text:data.addonCat!.isNotEmpty?"Customization Available":"",
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data.dishImage!),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: categoryDish.length),
        ),
      ),
    );
  }
}
