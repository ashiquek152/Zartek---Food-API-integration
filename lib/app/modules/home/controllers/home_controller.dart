import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:http/http.dart' as http;
import 'package:zartek/app/modules/home/views/views.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDishesDetails();
  }

  static const String URL = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";

  List<Widget> tabs = [];
  List<Widget> tabViews = [];
  List<DishesModel> dishesModelList = [];
  List<TableMenuList> tableMenuList = [];

  List<CategoryDishes> selectedItems = [];

  int totalItemsSelected = 0;

  getDishesDetails() async {
    await getDishes();
    update();
  }

  Future<List<DishesModel>> getDishes() async {
    try {
      final response = await http.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        dishesModelList = dishesModelFromJson(response.body);

        for (var i = 0; i < dishesModelList.first.tableMenuList.length; i++) {
          final data = dishesModelList.first.tableMenuList[i];
          tableMenuList.add(data);
        }

        for (var element in tableMenuList) {
          tabs.add(Tab(text: element.menuCategory.toString()));
          createTabViews(data: element.categoryDishes!);
        }
      }
    } on SocketException {
      Get.snackbar("Network Error", "Plaease check internet connction");
    } catch (e) {
      log(e.toString());
    }
    return dishesModelList;
  }

  void createTabViews({required List<CategoryDishes> data}) {
    tabViews.clear();
    for (var element in tableMenuList) {
      tabViews.add(DishDetailsTile(categoryDish: element.categoryDishes!));
    }
  }

  addDishesToList(CategoryDishes categoryDishes) {
    if (selectedItems.contains(categoryDishes)) {
      categoryDishes.quantity = (categoryDishes.quantity! + 1);
    } else {
      selectedItems.add(categoryDishes);
      categoryDishes.quantity = 1;
      totalItemsSelected = selectedItems.length;
      log(totalItemsSelected.toString());
    }
    update();
  }

  removeDishesFromList(CategoryDishes categoryDishes) {
    if (selectedItems.contains(categoryDishes)) {
      if (categoryDishes.quantity! <=1) {
        categoryDishes.quantity = 0;
        selectedItems.remove(categoryDishes);
        totalItemsSelected = selectedItems.length;
        log(totalItemsSelected.toString());
      } else {
        categoryDishes.quantity = categoryDishes.quantity! - 1;
      }
      update();
    }
  }
}
