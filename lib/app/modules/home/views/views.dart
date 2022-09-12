import 'package:flutter/material.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:zartek/app/modules/home/widgets/details_tile_container.dart';

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
                return DetailsTileCustomContainer(data: data, index: index);
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
