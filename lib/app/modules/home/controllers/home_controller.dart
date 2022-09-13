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
    tabs.clear();
    tabViews.clear();
    dishesModelList.clear();
    tableMenuList.clear();
    selectedItems.clear();
    totalItemsSelected.value = 0;
    //  getDishesDetails();
  }

  static const String URL = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";

  List<Widget> tabs = [];
  List<Widget> tabViews = [];
  List<DishesModel> dishesModelList = [];
  List<TableMenuList> tableMenuList = [];

  List<CategoryDishes> selectedItems = [];
  RxInt totalItemsSelected = 0.obs;

  Future<List<DishesModel>> getDishesDetails() async {
    log("Calling Getdishes details");
    List<DishesModel> dishesModel = await getDishes();
    update();
    return dishesModel;
  }

  Future<List<DishesModel>> getDishes() async {
    tabViews.clear();
    dishesModelList.clear();
    tableMenuList.clear();
    try {
      final response = await http.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        dishesModelList = dishesModelFromJson(response.body);
       
        tableMenuList.clear();

        for (var i = 0; i < dishesModelList.first.tableMenuList.length; i++) {
          final data = dishesModelList.first.tableMenuList[i];
          tableMenuList.add(data);
        }
        tabs.clear();
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
    try {
      tabViews.clear();
      for (var element in tableMenuList) {
        tabViews.add(DishDetailsTile(categoryDish: element.categoryDishes!));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  addDishesToList(CategoryDishes categoryDishes) {
    try {
      if (selectedItems.contains(categoryDishes)) {
        categoryDishes.quantity = (categoryDishes.quantity! + 1);
      } else {
        selectedItems.add(categoryDishes);
        categoryDishes.quantity = 1;
        totalItemsSelected.value = selectedItems.length;
        log(totalItemsSelected.value.toString());
      }
      update();
    } catch (e) {
      e.toString();
    }
  }

  removeDishesFromList(CategoryDishes categoryDishes) {
    try {
      if (selectedItems.contains(categoryDishes)) {
        if (categoryDishes.quantity! <= 1) {
          categoryDishes.quantity = 0;
          selectedItems.remove(categoryDishes);
          totalItemsSelected.value = selectedItems.length;
          log(totalItemsSelected.value.toString());
        } else {
          categoryDishes.quantity = categoryDishes.quantity! - 1;
        }
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  clearAll() {
    try {
      for (var element in tableMenuList) {
        for (var dishCat in element.categoryDishes!) {
          dishCat.quantity = 0;
        }
      }
      totalItemsSelected.value = 0;
      selectedItems.clear();
      update();
      Get.back();
    } catch (e) {
      log(e.toString());
    }
  }
}
