import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zartek/app/data/dishes_model.dart';
import 'package:zartek/app/modules/checkout/views/checkout_view.dart';
import 'package:zartek/app/modules/home/widgets/drawer_homescreen.dart';
import 'package:zartek/app/widgets/loading.dart';
import 'package:zartek/app/widgets/text_customized.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DishesModel>>(
        future: homeController.getDishesDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            const Center(
              child: TextCustomized(
                fontSize: 16,
                text: "Something went wrong",
                textColor: Colors.pink,
              ),
            );
          }
          return DefaultTabController(
                  initialIndex: 0,
                  length: controller.tabs.length,
                  child: Scaffold(
                    drawer: DrawerHomescreen(),
                    appBar: AppBar(
                      iconTheme: const IconThemeData(color: Colors.green),
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      title: const TextCustomized(
                        fontSize: 25,
                        text: "DISHES",
                        fontWeight: FontWeight.bold,
                      ),
                      actions: [
                        InkWell(
                          onTap: () {
                            Get.to(() => CheckoutView(
                                selectedItems: controller.selectedItems));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                            child: Badge(
                              badgeContent: Obx(
                                () => TextCustomized(
                                  fontSize: 14,
                                  text: controller.totalItemsSelected.value
                                      .toString(),
                                ),
                              ),
                              child: const Icon(Icons.shopping_cart_sharp),
                            ),
                          ),
                        )
                      ],
                      bottom: TabBar(
                        isScrollable: true,
                        labelColor: Colors.pink,
                        unselectedLabelColor: Colors.black45,
                        unselectedLabelStyle: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        labelStyle: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        indicatorColor: Colors.pink,
                        tabs: controller.tabs,
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TabBarView(children: controller.tabViews),
                    ),
                  ),
                );
        });
  }
}
