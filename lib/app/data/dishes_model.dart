// To parserequired this JSON data, do
//
//     final dishesModel = dishesModelFromJson(jsonString);

import 'dart:convert';

List<DishesModel> dishesModelFromJson(String str) => List<DishesModel>.from(
    json.decode(str).map((x) => DishesModel.fromJson(x)));

String dishesModelToJson(List<DishesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DishesModel {
  DishesModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
    required this.tableId,
    required this.tableName,
    required this.branchName,
    required this.nexturl,
    required this.tableMenuList,
  });

  String restaurantId;
  String restaurantName;
  String restaurantImage;
  String tableId;
  String tableName;
  String branchName;
  String nexturl;
  List<TableMenuList> tableMenuList;

  factory DishesModel.fromJson(Map<String, dynamic> json) => DishesModel(
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        restaurantImage: json["restaurant_image"],
        tableId: json["table_id"],
        tableName: json["table_name"],
        branchName: json["branch_name"],
        nexturl: json["nexturl"],
        tableMenuList: List<TableMenuList>.from(
            json["table_menu_list"].map((x) => TableMenuList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "restaurant_image": restaurantImage,
        "table_id": tableId,
        "table_name": tableName,
        "branch_name": branchName,
        "nexturl": nexturl,
        "table_menu_list":
            List<dynamic>.from(tableMenuList.map((x) => x.toJson())),
      };
}

class TableMenuList {
  TableMenuList({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.menuCategoryImage,
    required this.nexturl,
    this.categoryDishes,
  });

  String menuCategory;
  String menuCategoryId;
  String menuCategoryImage;
  String nexturl;
  List<CategoryDishes>? categoryDishes;

  factory TableMenuList.fromJson(Map<String, dynamic> json) => TableMenuList(
        menuCategory: json["menu_category"],
        menuCategoryId: json["menu_category_id"],
        menuCategoryImage: json["menu_category_image"],
        nexturl: json["nexturl"],
        categoryDishes: json["category_dishes"] == null
            ? null
            : List<CategoryDishes>.from(
                json["category_dishes"].map((x) => CategoryDishes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu_category": menuCategory,
        "menu_category_id": menuCategoryId,
        "menu_category_image": menuCategoryImage,
        "nexturl": nexturl,
        "category_dishes": categoryDishes == null
            ? null
            : List<dynamic>.from(categoryDishes!.map((x) => x.toJson())),
      };
}

class CategoryDishes {
  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  String? dishCurrency;
  double? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  int? dishType;
  String? nexturl;
  List<AddonCat>? addonCat;
  int? quantity;

  CategoryDishes({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
    required this.dishCurrency,
    required this.dishCalories,
    required this.dishDescription,
    required this.dishAvailability,
    required this.dishType,
    required this.nexturl,
    required this.addonCat,
    this.quantity,
  });

  CategoryDishes.fromJson(Map<String, dynamic> json) {
    dishId = json['dish_id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishCurrency = json['dish_currency'];
    dishCalories = json['dish_calories'];
    dishDescription = json['dish_description'];
    dishAvailability = json['dish_Availability'];
    dishType = json['dish_Type'];
    nexturl = json['nexturl'];
    if (json['addonCat'] != null) {
      addonCat = <AddonCat>[];
      json['addonCat'].forEach((v) {
        addonCat?.add(AddonCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dish_id'] = dishId;
    data['dish_name'] = dishName;
    data['dish_price'] = dishPrice;
    data['dish_image'] = dishImage;
    data['dish_currency'] = dishCurrency;
    data['dish_calories'] = dishCalories;
    data['dish_description'] = dishDescription;
    data['dish_Availability'] = dishAvailability;
    data['dish_Type'] = dishType;
    data['nexturl'] = nexturl;
    if (addonCat != null) {
      data['addonCat'] = addonCat?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddonCat {
  String? addonCategory;
  String? addonCategoryId;
  int? addonSelection;
  String? nexturl;
  List<Addons>? addons;

  AddonCat(
      {this.addonCategory,
      this.addonCategoryId,
      this.addonSelection,
      this.nexturl,
      this.addons});

  AddonCat.fromJson(Map<String, dynamic> json) {
    addonCategory = json['addon_category'];
    addonCategoryId = json['addon_category_id'];
    addonSelection = json['addon_selection'];
    nexturl = json['nexturl'];
    if (json['addons'] != null) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons?.add(Addons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['addon_category'] = addonCategory;
    data['addon_category_id'] = addonCategoryId;
    data['addon_selection'] = addonSelection;
    data['nexturl'] = nexturl;
    if (addons != null) {
      data['addons'] = addons?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addons {
  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  String? dishCurrency;
  double? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  int? dishType;

  Addons(
      {this.dishId,
      this.dishName,
      this.dishPrice,
      this.dishImage,
      this.dishCurrency,
      this.dishCalories,
      this.dishDescription,
      this.dishAvailability,
      this.dishType});

  Addons.fromJson(Map<String, dynamic> json) {
    dishId = json['dish_id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishCurrency = json['dish_currency'];
    dishCalories = json['dish_calories'];
    dishDescription = json['dish_description'];
    dishAvailability = json['dish_Availability'];
    dishType = json['dish_Type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dish_id'] = dishId;
    data['dish_name'] = dishName;
    data['dish_price'] = dishPrice;
    data['dish_image'] = dishImage;
    data['dish_currency'] = dishCurrency;
    data['dish_calories'] = dishCalories;
    data['dish_description'] = dishDescription;
    data['dish_Availability'] = dishAvailability;
    data['dish_Type'] = dishType;
    return data;
  }
}
