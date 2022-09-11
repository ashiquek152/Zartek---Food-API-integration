import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:http/http.dart' as http;
import 'package:zartek/app/modules/home/views/views.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    getDishesDetails();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
  static const String URL = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";

  List<Widget> tabs = [];
  List<Widget> tabViews = [];
  List<DishesModel> dishesModelList = [];
  List<TableMenuList> tableMenuList = [];

  getDishesDetails() async {
    await getDishes();
    // createTabs(data: data1);
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
          tabs.add(
            Tab(text: element.menuCategory.toString()),
          );
          createTabViews(data: element.categoryDishes!);

          log("TAB HEADING ${element.menuCategory.toString()}");
        }
      }
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
}
