import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zartek/app/modules/home/widgets/drawer_homescreen.dart';
import 'package:zartek/app/widgets/loading.dart';
import 'package:zartek/app/widgets/text_customized.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return controller.tabs.isEmpty
          ? const LoadingWidget()
          : DefaultTabController(
              initialIndex: 0,
              length: controller.tabs.length,
              child: Scaffold(
                drawer: DrawerHomescreen(controller: controller),
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.green),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: const TextCustomized(
                    fontSize: 25,
                    text: "DISHES",
                    fontWeight: FontWeight.bold,
                  ),
                  bottom: TabBar(
                    onTap: (index){
                      log(index.toString());
                    },
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
