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

  List<String> menuItemsNames = [];
  List<Widget> tabs = [];
  List<Widget> tabViews = [];
  List<DishesModel> dishesModelList = [];
  int tabBarLength = 0;
  List<CategoryDishes> categoryDishesList = [];

  getDishesDetails() async {
    await getDishes();
    final data1 =dishesModelList.first.tableMenuList; 
    final data = dishesModelList.first.tableMenuList.first.categoryDishes!;
    createTabs(data: data1);
    createTabViews(data: data);
    
    update();
  }

  Future<List<DishesModel>> getDishes() async {
    try {
      final response = await http.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        dishesModelList = dishesModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return dishesModelList;
  }

  void createTabs({required List<TableMenuList> data}) async {
    tabs.clear();
    for (var i = 0; i < data.length; i++) {
      final dishModelAtindex = data[i];
      tabs.add(Tab(
        text: dishModelAtindex.menuCategory.toString(),
      ));
    }
    log(tabs.length.toString());
  }

  void createTabViews({required List<CategoryDishes> data}) {
    tabViews.clear();
    for (var i = 0; i < data.length; i++) {
      tabViews.add( DishDetailsTile(categoryDish: data,));
    }
    log(tabViews.length.toString());
  }

}
